import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class RemoveCartDialog extends StatelessWidget {
  final CartItemModel cartItemModel;
  final int index;
  final CartController cartController;
  const RemoveCartDialog({
    super.key,
    required this.index,
    required this.cartItemModel,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AlertDialog(
        backgroundColor: txtColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),

        contentPadding: EdgeInsets.only(top: 20.h),

        //content
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //title
            Padding(
              padding: EdgeInsets.only(top: mq.height * .01),
              child: const Text(
                'Remove from cart?',
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .1),
              child: Text(
                "Are you sure you want to remove ${cartItemModel.dishName} from cart?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp, color: blackColor),
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
            width: mq.width * .35,
            child: Semantics(
              button: true,
              child: CustomButton(
                color: const Color(0xffFFEEEE).withValues(alpha: .80),
                borderClr: pColor,
                text: 'No',
                textColor: pColor,
                fontSize: 13,
                height: 10,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
          SizedBox(
            width: mq.width * .35,
            child: Semantics(
              button: true,
              child: CustomButton(
                color: pColor,
                text: 'Yes',
                fontSize: 13,
                height: 10,
                onTap: () {
                  context.pop();
                  cartController.removeFromCart(cartItemModel);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
