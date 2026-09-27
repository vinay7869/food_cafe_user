import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/order_history/controller/order_history_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/custome_code.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  // late final OrderHistoryController orderHistoryController;
  final OrderHistoryController orderHistoryController =
      Get.find<OrderHistoryController>();

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  Future<void> getHistory() async {
    await orderHistoryController.getOrderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text('My Orders'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),

      body: Obx(
        () => Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
          child: orderHistoryController.isLoading.value
              ? Center(child: CircularProgressIndicator.adaptive())
              : orderHistoryController.orderHistory.isEmpty
              ? Center(child: Text('No Orders Placed'))
              : ListView.builder(
                  padding: EdgeInsets.only(bottom: 10.h),
                  physics: BouncingScrollPhysics(),
                  itemCount: orderHistoryController.orderHistory.length,
                  itemBuilder: (context, index) {
                    final order = orderHistoryController.orderHistory[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 17.h),
                      child: Card(
                        elevation: 3,
                        color: txtColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: order.cartItems.length,
                                itemBuilder: (context, itemIndex) {
                                  final cartItem = order.cartItems[itemIndex];
                                  final dish = cartItem.dishModel;

                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 15.w,
                                              left: 3.w,
                                            ),
                                            child: Container(
                                              height: 45.h,
                                              width: 45.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      40.r,
                                                    ),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          CircularProgressIndicator.adaptive(),
                                                  imageUrl: dish.image,
                                                ),
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            child: AutoSizeText(
                                              "${dish.name} (${dish.extras?.variants[cartItem.selectedVariantIndex!].name})",
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 10.w,
                                            ),
                                            child: Image.asset(
                                              dish.isVeg
                                                  ? '$imagePath/Veg.png'
                                                  : '$imagePath/Nonveg.png',
                                              scale: 4.7,
                                            ),
                                          ),
                                        ],
                                      ),

                                      //
                                      Visibility(
                                        visible:
                                            cartItem.selectedAddonIndexes !=
                                                null &&
                                            cartItem
                                                .selectedAddonIndexes!
                                                .isNotEmpty,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Divider(),
                                        ),
                                      ),

                                      if (cartItem.selectedAddonIndexes !=
                                              null &&
                                          cartItem
                                              .selectedAddonIndexes!
                                              .isNotEmpty)
                                        ...List.generate(
                                          cartItem.selectedAddonIndexes!.length,
                                          (addonIndex) {
                                            return Row(
                                              children: [
                                                Text(
                                                  "   1 x ${dish.extras!.addons[addonIndex].name}",
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),

                                      //
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Divider(),
                                      ),
                                    ],
                                  );
                                },
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 1.h, bottom: 7.h),
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      3,
                                      (index) => Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              index == 0
                                                  ? "Payment"
                                                  : index == 1
                                                  ? "Amount"
                                                  : "Date",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: const Color.fromARGB(
                                                  255,
                                                  252,
                                                  97,
                                                  97,
                                                ),
                                              ),
                                            ),

                                            SizedBox(height: 5.h),

                                            Text(
                                              index == 0
                                                  ? order.paymentMethod
                                                  : index == 1
                                                  ? order.totalAmount
                                                        .toStringAsFixed(2)
                                                  : CustomeCode.dateFormater(
                                                      date: order.createdAt,
                                                    ),
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Text(
                              //   textAlign: TextAlign.start,
                              //   'Order Successfully Delivered at ${order.address!.addressType.name.toUpperCase()}',
                              // ).paddingOnly(bottom: 7.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomButton(
                                    color: pColor,
                                    fontSize: 12,
                                    text: 'Repeat Order',
                                    onTap: () {},
                                    width: 140.w,
                                  ),
                                  CustomButton(
                                    color: pColor,
                                    fontSize: 12,
                                    text: 'Download Invoice',
                                    onTap: () {},
                                    width: 140.w,
                                  ),
                                ],
                              ).paddingOnly(bottom: 4.h),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
