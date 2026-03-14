import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_cafe_user/project/controllers/nav_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/custome_code.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'custom_button.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

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
                'Rate Us!',
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

            //rate us
            Semantics(
              button: true,
              child: InkWell(
                // onTap: () => CustomeCode.launchURL(),
                child: Image.asset(
                  '$imagePath/rate.png',
                  height: 37,
                  width: mq.width * .5,
                ),
              ),
            ),

            const Text(
              'Do you want to exit the app?',
              style: TextStyle(
                fontSize: 15,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
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
                onTap: () => Nav.pop(),
              ),
            ),
          ),

          SizedBox(
            width: mq.width * .32,
            child: Semantics(
              button: true,
              child: CustomButton(
                color: pColor,
                text: 'Exit',
                onTap: () => SystemNavigator.pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
