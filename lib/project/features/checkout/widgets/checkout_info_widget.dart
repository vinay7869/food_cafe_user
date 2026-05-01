import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/bottom_nav/widgets/remove_from_cart_dilog.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CheckoutInfoWidget extends StatefulWidget {
  const CheckoutInfoWidget({
    super.key,
    required this.cartItemModel,
    required this.i,
    required this.cartController,
    required this.calToPay,
  });

  final CartItemModel cartItemModel;
  final int i;
  final CartController cartController;
  final VoidCallback calToPay;

  @override
  State<CheckoutInfoWidget> createState() => _CheckoutInfoWidgetState();
}

class _CheckoutInfoWidgetState extends State<CheckoutInfoWidget> {
  final price = 0.0.obs;

  @override
  void initState() {
    super.initState();

    price.value = widget.cartItemModel.finalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: mq.height * .02),
          child: Obx(
            () => Row(
              children: [
                Image.asset(
                  widget.cartItemModel.dishModel.isVeg
                      ? '$imagePath/Veg.png'
                      : '$imagePath/Nonveg.png',
                  scale: 4.7,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mq.width * .02),
                  child: SizedBox(
                    width: mq.width * .37,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.cartItemModel.dishModel.name} (${widget.cartItemModel.selectedVariantIndex != null ? widget.cartItemModel.dishModel.extras!.variants[widget.cartItemModel.selectedVariantIndex!].name : ''})",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        if (widget.cartItemModel.dishModel.extras != null)
                          (widget.cartItemModel.selectedAddonIndexes != null &&
                                  widget
                                      .cartItemModel
                                      .selectedAddonIndexes!
                                      .isNotEmpty)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    widget
                                        .cartItemModel
                                        .selectedAddonIndexes!
                                        .length,
                                    (index) {
                                      final addonIndex = widget
                                          .cartItemModel
                                          .selectedAddonIndexes![index];

                                      return Text(
                                        "1 x ${widget.cartItemModel.dishModel.extras!.addons[addonIndex].name}",
                                        style: TextStyle(fontSize: 11.sp),
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 27.w,
                  width: 57.w,
                  margin: EdgeInsets.only(left: 15.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (widget.cartItemModel.quantity == 1) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return RemoveCartDialog(
                                  dishNmae: widget.cartItemModel.dishModel.name,
                                  onTap: () {
                                    context.pop();
                                    widget.cartController.removeFromCart(
                                      widget.cartItemModel,
                                    );
                                    widget.calToPay();

                                    if (widget
                                        .cartController
                                        .cartList
                                        .isEmpty) {
                                      context.pop();
                                      return;
                                    }
                                  },
                                );
                              },
                            );
                            return;
                          }
                          widget.cartItemModel.quantity--;

                          price.value =
                              widget.cartItemModel.finalPrice *
                              widget.cartItemModel.quantity;

                          widget.calToPay();
                        },
                        child: Text(
                          '-',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      Text(
                        "${widget.cartItemModel.quantity}",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.cartItemModel.quantity++;

                          price.value =
                              widget.cartItemModel.finalPrice *
                              widget.cartItemModel.quantity;

                          widget.calToPay();
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
                Text("₹${price.value.toStringAsFixed(2)}"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
