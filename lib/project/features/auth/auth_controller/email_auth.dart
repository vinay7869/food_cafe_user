import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/my_dialogs.dart';

class EmailAuth {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<bool> createEmailAuth({
    required String email,
    required String password,
    required DateTime dob,
    required String phoneNumber,
  }) async {
    try {
      final UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        log('UID --> ${credential.user!.uid}');
        UserController().createUser(
          user: credential.user!,
          dob: dob,
          phone: phoneNumber,
        );
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code.contains('waek-password')) {
        MyDialogs.error(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        MyDialogs.error(msg: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        MyDialogs.error(msg: 'Invalid Email Id');
      }
      log(e.toString());
      return false;
    } catch (e) {
      MyDialogs.error(msg: 'Invalid Credentials');
      return false;
    }
  }

  static Future<bool> loginInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credentials.user != null) {
        log('UID --> ${credentials.user!.uid}');
        UserController().createUser(user: credentials.user!);
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-credential') {
        log('message--- ui ma');
      } else if (e.code == 'user-not-found') {
        MyDialogs.error(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        MyDialogs.error(msg: 'Wrong password provided for that user.');
      } else {
        MyDialogs.error(msg: 'Invalid Credentials');
      }
      log(e.toString());
      return false;
    }
  }

  static Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  static Future<void> forgotPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);

      MyDialogs.info(
        msg: 'Password Reset email sent. Please check your email address.',
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
