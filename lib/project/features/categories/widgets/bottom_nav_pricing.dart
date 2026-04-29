import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/categories/controllers/price_controller.dart';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:food_cafe_user/project/features/categories/screens/dish_info.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:get/get.dart';

class BottomNavPricing extends StatelessWidget {
  const BottomNavPricing({
    super.key,
    required PriceController priceController,
    required this.showH,
    required CartController cartController,
    required this.widget,
  }) : _priceController = priceController,
       _cartController = cartController;

  final PriceController _priceController;
  final RxBool showH;
  final CartController _cartController;
  final DishInfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * .10,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: mq.width * .05, right: mq.width * .05),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.withValues(alpha: .27)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price', style: TextStyle(color: Color(0xff818181))),
              Obx(
                () => Text(
                  '₹ ${_priceController.finalPrice.value}',
                  style: TextStyle(
                    color: pColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),

          Obx(() {
            final cartStruct = CartItemModel(
              dishName: widget.dishModel.name,
              selectedVariantIndex: _priceController.selectedVariant.value,
              selectedAddonIndexes: _priceController.addonsSelected,
              finalPrice: _priceController.finalPrice.value,
              dishImage: widget.dishModel.image,
            );

            final isInCart = _cartController.isItemInCart(cartStruct);

            return isInCart
                ? CustomButton(
                    text: 'Remove Item',
                    onTap: () {
                      _cartController.removeFromCart(cartStruct);
                      _cartController.finalPrice.value = 0.0;
                    },
                    color: Colors.red,
                    width: mq.width * .67,
                  )
                : CustomButton(
                    text: 'Add Item',
                    onTap: () {
                      showH.value = true;
                      Future.delayed(
                        const Duration(seconds: 4),
                        () => showH.value = false,
                      );

                      _cartController.addToCart(item: cartStruct);

                      _cartController.finalPrice.value =
                          _priceController.finalPrice.value;
                    },
                    color: pColor,
                    width: mq.width * .67,
                  );
          }),
        ],
      ),
    );
  }
}
