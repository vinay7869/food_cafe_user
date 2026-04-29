import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/bottom_nav/widgets/remove_from_cart_dilog.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:go_router/go_router.dart';

class BottomOrderCard extends StatelessWidget {
  final CartItemModel cartItemModel;
  final int i;
  final CartController cartController;
  const BottomOrderCard({
    super.key,
    required this.cartItemModel,
    required this.i,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: mq.height * .007),
      width: double.maxFinite,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 7, color: Colors.grey.withValues(alpha: .80)),
        ],
        color: txtColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      margin: EdgeInsets.only(bottom: mq.height * .01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 27.r,
            backgroundImage: CachedNetworkImageProvider(
              cartItemModel.dishImage ?? '',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: mq.width * .02,
              right: mq.width * .02,
            ),
            child: SizedBox(
              width: mq.width * .26,
              child: Text(
                cartItemModel.dishName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          InkWell(
            onTap: () => context.goNamed('checkout'),
            child: Container(
              width: mq.width * .33,
              height: mq.height * .06,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '₹ ${cartItemModel.finalPrice}',
                    style: const TextStyle(
                      color: txtColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Checkout',
                    style: TextStyle(color: txtColor, fontSize: 13.sp),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return RemoveCartDialog(
                    index: i,
                    cartItemModel: cartItemModel,
                    cartController: cartController,
                  );
                },
              );
            },
            icon: const Icon(CupertinoIcons.delete),
          ),
        ],
      ),
    );
  }
}
