import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAuth {
  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn.instance;

  Future<bool> signInWithGoogle() async {
    try {
      await googleSignIn.initialize(serverClientId: clientId);

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleSignInAuthentication =
          googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
      );

      final userCredentials = await firebaseAuth.signInWithCredential(
        credential,
      );

      if (userCredentials.user != null) {
        log('User logged in successfully');
        await Pref.setString('uid', userCredentials.user!.uid);
        UserController().createUser(user: userCredentials.user!);

    

        return true;
      } else {
        log('Something went wrong');

        return false;
      }

      //
    } on FirebaseAuthException catch (e) {
      log('Google login failed with $e');
      return false;
    }
  }

  Future<void> googleSignOut() async {
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}
