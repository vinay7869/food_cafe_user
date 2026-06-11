import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/checkout/controller/checkout_controller.dart';
import 'package:food_cafe_user/project/features/order_history/controller/order_history_controller.dart';
import 'package:food_cafe_user/project/features/order_history/model/order_history_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class OrderSuccessDialog extends StatefulWidget {
  final String paymentId, orderId, paymentMethod;
  const OrderSuccessDialog({
    super.key,
    required this.paymentId,
    required this.orderId,
    required this.paymentMethod,
  });
  @override
  State<OrderSuccessDialog> createState() => _OrderSuccessDialogState();
}

class _OrderSuccessDialogState extends State<OrderSuccessDialog> {
  final _checkoutController = Get.find<CheckoutController>();

  final _orderHistoryController = Get.find<OrderHistoryController>();
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
                Image.asset('assets/lotties/delivery.gif', scale: 12),

                //title
                Padding(
                  padding: EdgeInsets.only(top: mq.height * .01),
                  child: Text(
                    'Thank you for ordering',
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
                    'Your Order is on the way!',
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
            right: mq.width * .17,
            top: 0,
            bottom: mq.height * .19,
            child: GestureDetector(
              onTap: () async {
                final orderModel = OrderHistoryModel(
                  paymentId: widget.paymentId,
                  orderId: widget.orderId,
                  paymentMethod: widget.paymentMethod,
                  createdAt: DateTime.now(),
                  totalAmount: _checkoutController.toPay.value,
                  cartItems: _checkoutController.cartController.cartList,
                  address: _checkoutController.defaultAdd,
                );

                _orderHistoryController.addOrderHistory(orderModel);
                context.pop();
              },
              child: Icon(CupertinoIcons.xmark_circle, size: 24.h),
            ),
          ),
        ],
      ),
    );
  }
}
