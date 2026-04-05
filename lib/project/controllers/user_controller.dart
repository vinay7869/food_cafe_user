import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_cafe_user/project/features/auth/model/user_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUser({
    required User user,
    DateTime? dob,
    String? phone,
  }) async {
    try {
      final uid = user.uid;

      final createUserStruct = UserModel(
        uid: user.uid,
        name: user.displayName ?? 'User',
        email: user.email ?? '',
        phone: user.phoneNumber ?? phone ?? '',
        profilePic: user.photoURL ?? '',
        address: [],
        dob: dob,
      );

      await firebaseFirestore
          .collection('user')
          .doc(uid)
          .set(createUserStruct.toJson(), SetOptions(merge: true));

      log('User created success -->> ${createUserStruct.toJson()}');

      Pref.setString('uid', user.uid);

      log('User Created!!!');
    } catch (e) {
      log(e.toString());
      return;
    }
  }

  Future<UserModel?> getUser({required String uid}) async {
    final user = await firebaseFirestore.collection('user').doc(uid).get();

    if (!user.exists) return null;

    return UserModel.fromJson(user.data()!);
  }
}
