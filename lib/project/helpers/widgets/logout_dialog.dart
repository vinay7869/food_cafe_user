import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/features/auth/auth_controller/email_auth.dart';
import 'package:food_cafe_user/project/features/auth/auth_controller/google_auth.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:go_router/go_router.dart';
import 'custom_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AlertDialog(
        backgroundColor: txtColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: pColor),
        ),

        contentPadding: const EdgeInsets.only(top: 20),

        //content
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //title
            Padding(
              padding: EdgeInsets.only(top: mq.height * .01),
              child: const Text(
                'Logout',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //for adding some space
            SizedBox(height: mq.height * .03),

            const Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 12, color: Color(0xff686868)),
            ),
          ],
        ),

        actionsAlignment: MainAxisAlignment.spaceEvenly,

        actionsPadding: EdgeInsets.only(
          bottom: mq.height * .04,
          top: mq.height * .03,
        ),

        actions: [
          //exit
          SizedBox(
            width: mq.width * .32,
            child: Semantics(
              button: true,
              child: CustomButton(
                color: const Color(0xffFFEEEE),
                borderClr: pColor,
                text: 'Cancel',
                textColor: pColor,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),

          SizedBox(
            width: mq.width * .32,
            child: Semantics(
              button: true,
              child: CustomButton(
                color: pColor,
                text: 'Logout',
                onTap: () async {
                  await GoogleSignInAuth().googleSignOut();
                  await EmailAuth.signOut();

                  await Pref.setBool('skip_intro', false);
                  if (!context.mounted) return;
                  context.go('/auth-landing-page');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
