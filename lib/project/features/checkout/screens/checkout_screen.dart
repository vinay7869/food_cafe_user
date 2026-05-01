import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/checkout/controller/checkout_controller.dart';
import 'package:food_cafe_user/project/features/checkout/widgets/checkout_info_widget.dart';
import 'package:food_cafe_user/project/features/profile/controllers/profile_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
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
  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    _checkoutController.calculateTotal();
    _checkoutController.calculateToPay();
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
            _deliveryInfoWidget(_profileController),

            // Payment method
            _paymentMethodWidget(isSelected),
          ],
        ),
      ),
      bottomNavigationBar: _placeOrderCta(),
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


Widget _deliveryInfoWidget(ProfileController profileController) {
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
          'Deliver to',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withValues(alpha: .10)),
          boxShadow: [
            BoxShadow(color: Colors.grey.withValues(alpha: .10), blurRadius: 7),
          ],
        ),
        padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .03),
        child: Padding(
          padding: EdgeInsets.only(left: mq.width * .03, right: mq.width * .03),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('$imagePath/location.png', scale: 4),
                   SizedBox(width: 14.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Row(
                        children: [
                          Text('Deliver at'),
                          Text(
                            " Home",
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
                          '',
                        // profileController.user.value.address
                          // NavController
                          //         .userData
                          //         .value
                          //         .address
                          //         .text
                          //         .isEmpty
                          //     ? "Enter Your Address here"
                          //     : NavController.userData.value.address.text,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Nav.to(const AddressScreen());
                    },
                    child: const Icon(Icons.edit),
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
                  const SizedBox(width: 14),
                  Text(
                    // '${NavController.userData.value.displayName.text},',
                    '',
                  ),
                  // NavController.userData.value.phoneNo.text.isEmpty
                  //     ?
                  GestureDetector(
                    onTap: () {
                      // Nav.to(const EditProfileScreen());
                    },
                    child: const Text(
                      "  Your phone number",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: pColor,
                      ),
                    ),
                  ),
                  // : Text(
                  //     "  ${NavController.userData.value.phoneNo.text}",

                  //   ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _paymentMethodWidget(RxInt isSelected) {
  return Column(
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
          borderRadius: const BorderRadius.all(Radius.circular(14)),
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
                    Radio(
                      value: 0,
                      groupValue: isSelected.value,
                      onChanged: (v) {
                        isSelected.value = v!;
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('$imagePath/card.png', scale: 4),
                    const SizedBox(width: 14),
                    const Text("Cash on Delivery"),
                    const Spacer(),
                    Radio(
                      value: 1,
                      groupValue: isSelected.value,
                      onChanged: (v) {
                        isSelected.value = v!;
                      },
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

Widget _placeOrderCta() {
  return SafeArea(
    child: SizedBox(
      height: 70.h,
      width: double.maxFinite,
      child: CustomButton(
        text: 'Place Order',
        onTap: () {
          // if (NavController.userData.value.address.text.isEmpty) {
          //   showSnackbar(context, 'Please enter delivery Address');
          //   return;
          // } else if (NavController.userData.value.phoneNo.text.isEmpty) {
          //   showSnackbar(context, 'Please Provide your Phone number');
          //   return;
          // } else if (isSelected.value == 0) {
          //   final payC = Get.find<PaymentController>();
          //   payC.startPayment(
          //     amount: toPay.value * 100,
          //     phoneNo: NavController.userData.value.phoneNo.text,
          //   );
          //   UpdateData.clearCart();
          // } else {
          //   Get.dialog(const OrderConfirmDialog());
          //   UpdateData.clearCart();
          // }
        },
        color: pColor,
        width: mq.width * .8,
      ),
    ),
  );
}
