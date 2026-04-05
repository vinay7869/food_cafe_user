import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/features/auth/model/user_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final UserController userController = Get.put(UserController());
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel().obs;
  final firebaseFirestore = FirebaseFirestore.instance;
  Rx<XFile?> image = Rx<XFile?>(null);
  final firebaseStorage = FirebaseStorage.instance;

  final String? uid = Pref.getString('uid');

  Future<UserModel?> fetchUser() async {
    if (uid == null) return null;

    try {
      isLoading.value = true;

      final userData = await userController.getUser(uid: uid!);

      if (userData != null) {
        user.value = userData;
      }

      return userData;
    } catch (e) {
      log("Fetch User Error: $e");
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUser(Map<String, dynamic> userData) async {
    if (uid == null) return;

    try {
      isLoading.value = true;

      userData.removeWhere((key, value) => value == null);

      final doc = firebaseFirestore.collection('user').doc(uid);

      await doc.update(userData);

      await fetchUser();
    } catch (e) {
      log("Update User Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedImage == null) return;

    image.value = pickedImage;
  }

  Future<String?> uploadToFirebase(String filePath) async {
    try {
      final file = File(filePath);

      final ref = firebaseStorage.ref().child('Users/$uid/profilePic.jpg');

      await ref.putFile(file);

      final downloadUrl = await ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
