import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/bottom_nav/widgets/remove_from_cart_dilog.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
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

  final toPay = 0.0.obs;

  void totalAmt() {
    toPay.value = _cartController.cartList.fold(0, (previousValue, element) {
      return previousValue + (element.finalPrice * element.quantity);
    });
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
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                color: Colors.white,
                border: Border.all(color: Colors.grey.withValues(alpha: .10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .10),
                    blurRadius: 7,
                  ),
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
                  ..._cartController.cartList.mapIndexed(
                    (i, e) => CalTotalPrice(
                      cartItemModel: e,
                      i: i,
                      cartController: _cartController,
                    ),
                  ),
                  SizedBox(height: mq.height * .03),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "To Pay",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Spacer(),
                      Obx(() {
                        totalAmt();
                        return Text("₹${toPay.value}");
                      }),
                    ],
                  ),
                ],
              ),
            ),
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
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .10),
                    blurRadius: 7,
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: mq.height * .02,
                bottom: mq.height * .03,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: mq.width * .03,
                  right: mq.width * .03,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('$imagePath/location.png', scale: 4),
                        const SizedBox(width: 14),
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
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .10),
                    blurRadius: 7,
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: mq.height * .02,
                bottom: mq.height * .02,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: mq.width * .03,
                  right: mq.width * .03,
                ),
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
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 70,
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
      ),
    );
  }
}

class CalTotalPrice extends StatelessWidget {
  const CalTotalPrice({
    super.key,
    required this.cartItemModel,
    required this.i,
    required this.cartController,
  });

  final CartItemModel cartItemModel;
  final int i;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    final price = cartItemModel.finalPrice.obs;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: mq.height * .02),
          child: Obx(
            () => Row(
              children: [
                Image.asset(
                  cartItemModel.dishImage == null
                      ? '$imagePath/Veg.png'
                      : '$imagePath/Nonveg.png',
                  scale: 3.2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mq.width * .02),
                  child: SizedBox(
                    width: mq.width * .37,
                    child: Text(
                      cartItemModel.dishName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Container(
                  height: 30.w,
                  width: 80.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (cartItemModel.quantity == 1) {
                            Get.dialog(
                              RemoveCartDialog(
                                index: i,
                                cartItemModel: cartItemModel,
                                cartController: cartController,
                              ),
                            );
                            return;
                          }
                          cartItemModel.quantity--;
                          // UpdateData.updateCart(
                          //     productId: cartItemModel.itemId,
                          //     qty: cartItemModel.qty.value);
                          price.value =
                              cartItemModel.finalPrice * cartItemModel.quantity;
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Text(
                        "${cartItemModel.quantity}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartItemModel.quantity++;
                          // UpdateData.updateCart(
                          //     productId: cartItemModel.itemId,
                          //     qty: cartItemModel.qty.value);
                          price.value =
                              cartItemModel.finalPrice * cartItemModel.quantity;
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text("₹${price.value}"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
