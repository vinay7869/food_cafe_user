import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:go_router/go_router.dart';

class OrderFailureDialog extends StatelessWidget {
  const OrderFailureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          AlertDialog(
            backgroundColor: txtColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
              side: const BorderSide(color: pColor),
            ),

            //content
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset('assets/lotties/delivery.gif', scale: 12),
                Icon(Icons.crisis_alert, size: 20.h),

                //title
                Padding(
                  padding: EdgeInsets.only(top: mq.height * .01),
                  child: Text(
                    'Order Failed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: pColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //for adding some space
                SizedBox(height: mq.height * .01),

                const Align(
                  child: Text(
                    'Your Order has failed. If any amount debited, it will be refunded within 48 hours.',
                    style: TextStyle(
                      color: Color(0xff5F5F5F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: mq.width * .13,
            top: 0,
            bottom: mq.height * .17,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(CupertinoIcons.xmark_circle),
            ),
          ),
        ],
      ),
    );
  }
}
