import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';

class DishService {
  final _firestore = FirebaseFirestore.instance;

  Future<String> uploadImage(File file) async {
    final ref = FirebaseStorage.instance.ref().child(
      'dish_images/${DateTime.now().millisecondsSinceEpoch}',
    );

    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  // 🔍 Check category exists
  Future<bool> checkCategoryExists(String categoryId) async {
    final doc = await _firestore.collection('categories').doc(categoryId).get();
    return doc.exists;
  }

  // ➕ Create category + first dish
  Future<void> createCategoryWithDish({
    required String categoryId,
    required String categoryName,
    required DishModel dish,
    File? imageFile,
  }) async {
    String imageUrl = "";

    if (imageFile != null) {
      imageUrl = await uploadImage(imageFile);
    }

    // 🔥 CREATE CATEGORY
    await _firestore.collection('categories').doc(categoryId).set({
      "name": categoryName,
      "createdAt": FieldValue.serverTimestamp(),
    });

    // 🔥 ADD FIRST DISH
    await _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('dishes')
        .add({
          ...dish.toJson(),
          "image": imageUrl,
          "createdAt": FieldValue.serverTimestamp(),
        });
  }

  Future<void> updateDish({
    required String categoryId,
    required String dishId,
    required DishModel dish,
    File? imageFile,
  }) async {
    String? imageUrl;

    // 🔥 Upload new image if selected
    if (imageFile != null) {
      imageUrl = await uploadImage(imageFile);
    }

    final docRef = _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('dishes')
        .doc(dishId);

    final updateData = {
      ...dish.toJson(),
      "updatedAt": FieldValue.serverTimestamp(),
    };

    // ✅ Only update image if new one selected
    if (imageUrl != null) {
      updateData["image"] = imageUrl;
    }

    await docRef.update(updateData);
  }
}
