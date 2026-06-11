import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_cafe_user/project/controllers/payment_controller.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/checkout/controller/checkout_controller.dart';
import 'package:food_cafe_user/project/features/checkout/widgets/checkout_info_widget.dart';
import 'package:food_cafe_user/project/features/checkout/widgets/order_success_dialog.dart';
import 'package:food_cafe_user/project/features/profile/screens/address/address_controller.dart/address_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/custome_code/my_dialogs.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final isSelected = 0.obs;

  final _cartController = Get.find<CartController>();
  final _checkoutController = Get.find<CheckoutController>();
  final _paymentController = Get.find<PaymentController>();

  @override
  void initState() {
    super.initState();
    _checkoutController.calculateTotal();
    _checkoutController.calculateToPay();
    _checkoutController.fetchDefaultAdd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(fontSize: 17.sp)),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),

      //
      body: Obx(
        () => ListView(
          padding: EdgeInsets.only(
            left: mq.width * .04,
            right: mq.width * .04,
            bottom: mq.height * .04,
          ),
          children: [
            // Checkout calculation view
            _checkoutCalculationWidget(_cartController, _checkoutController),

            // Delivery info Widget
            _deliveryInfoWidget(_checkoutController, context),

            // Payment method
            _paymentMethodWidget(isSelected),
          ],
        ),
      ),
      bottomNavigationBar: _placeOrderCta(
        _checkoutController,
        isSelected,
        _paymentController,
        context,
      ),
    );
  }
}

Widget _checkoutCalculationWidget(
  CartController cartController,
  CheckoutController checkoutController,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      color: Colors.white,
      border: Border.all(color: Colors.grey.withValues(alpha: .10)),
      boxShadow: [
        BoxShadow(color: Colors.grey.withValues(alpha: .10), blurRadius: 7),
      ],
    ),
    padding: EdgeInsets.only(
      top: mq.height * .02,
      bottom: mq.height * .03,
      left: mq.width * .03,
      right: mq.width * .03,
    ),
    child: Column(
      children: [
        ...cartController.cartList.mapIndexed(
          (i, e) => CheckoutInfoWidget(
            cartItemModel: e,
            i: i,
            cartController: cartController,
            calToPay: checkoutController.calculateTotal,
          ),
        ),

        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                Text(
                  "₹ ${checkoutController.totalAmount.value.toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 7.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "GST",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                const Spacer(),
                Text("3%", style: TextStyle(fontWeight: FontWeight.w300)),
              ],
            ),
            SizedBox(height: 7.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Delivery charges",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                Text(
                  checkoutController.totalAmount.value < 200
                      ? "₹ ${checkoutController.deliveryCharge}"
                      : "₹ 0",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: mq.height * .03),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "To Pay",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const Spacer(),
                Text(
                  "₹ ${checkoutController.toPay.value.toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _deliveryInfoWidget(
  CheckoutController checkoutController,
  BuildContext context,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          left: 5.w,
          top: mq.height * .03,
          bottom: mq.height * .03,
        ),
        child: const Text(
          'Deliver to',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.r)),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withValues(alpha: .10)),
          boxShadow: [
            BoxShadow(color: Colors.grey.withValues(alpha: .10), blurRadius: 7),
          ],
        ),
        padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .03),
        child: Padding(
          padding: EdgeInsets.only(left: mq.width * .03, right: mq.width * .03),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Image.asset('$imagePath/location.png', scale: 4),
                    SizedBox(width: 14.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            Text('Deliver at  '),
                            Text(
                              checkoutController
                                      .defaultAdd
                                      ?.addressType
                                      .label ??
                                  "Home",
                              style: TextStyle(
                                color: pColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: mq.width * .57,
                          child: Text(
                            checkoutController.defaultAdd != null
                                ? "${checkoutController.defaultAdd?.addressLine1}, ${checkoutController.defaultAdd?.street}, ${checkoutController.defaultAdd?.city}, ${checkoutController.defaultAdd?.pincode}."
                                : "No Address Added",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        context.pushNamed('address');
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                SizedBox(height: mq.height * .03),
                Row(
                  children: [
                    Image.asset('$imagePath/duration.png', scale: 4),
                    const SizedBox(width: 14),
                    const Text('Delivery in'),
                    const Text(
                      " 27 mins",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: pColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mq.height * .03),
                Row(
                  children: [
                    Image.asset('$imagePath/call.png', scale: 4),
                    SizedBox(width: 14.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          checkoutController.profileController.user.value.name,
                        ),
                        checkoutController
                                .profileController
                                .user
                                .value
                                .phone
                                .isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  context.goNamed('editProfile');
                                },
                                child: const Text(
                                  "Tap to add your phone number",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: pColor,
                                  ),
                                ),
                              )
                            : Text(
                                checkoutController
                                    .profileController
                                    .user
                                    .value
                                    .phone,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _paymentMethodWidget(RxInt isSelected) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          left: 5,
          top: mq.height * .03,
          bottom: mq.height * .03,
        ),
        child: const Text(
          'Payment methods',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.r)),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withValues(alpha: .10)),
          boxShadow: [
            BoxShadow(color: Colors.grey.withValues(alpha: .10), blurRadius: 7),
          ],
        ),
        padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .02),
        child: Padding(
          padding: EdgeInsets.only(left: mq.width * .03, right: mq.width * .03),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Image.asset('$imagePath/card.png', scale: 4),
                    const SizedBox(width: 14),
                    const Text("Net Banking / UPI"),
                    const Spacer(),
                    RadioGroup<int>(
                      groupValue: isSelected.value,
                      onChanged: (v) {
                        isSelected.value = v!;
                      },
                      child: Radio(value: 0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('$imagePath/card.png', scale: 4),
                    const SizedBox(width: 14),
                    const Text("Cash on Delivery"),
                    const Spacer(),
                    RadioGroup<int>(
                      groupValue: isSelected.value,
                      onChanged: (v) {
                        isSelected.value = v!;
                      },
                      child: Radio(value: 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _placeOrderCta(
  CheckoutController checkoutController,
  RxInt isSelected,
  PaymentController paymentController,
  BuildContext context,
) {
  return SafeArea(
    child: SizedBox(
      height: 70.h,
      width: double.maxFinite,
      child: CustomButton(
        text: 'Place Order',
        onTap: () {
          if (checkoutController.defaultAdd == null) {
            MyDialogs.showToast(
              'Add address to place order',
              Toast.LENGTH_LONG,
            );
          } else if (checkoutController
              .profileController
              .user
              .value
              .phone
              .isEmpty) {
            MyDialogs.showToast(
              'Add Phone no to place order',
              Toast.LENGTH_LONG,
            );
          } else if (isSelected.value == 0) {
            paymentController.startPayment(
              amount: (checkoutController.toPay.value * 100).toInt(),
              phoneNo: checkoutController.profileController.user.value.phone,
              context: context,
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return OrderSuccessDialog(
                  orderId: '',
                  paymentId: 'COD',
                  paymentMethod: 'COD',
                );
              },
            );
          }
        },
        color: pColor,
        width: mq.width * .8,
      ),
    ),
  );
}
