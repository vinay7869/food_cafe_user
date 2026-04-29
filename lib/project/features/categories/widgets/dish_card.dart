import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_loading.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';
import 'package:go_router/go_router.dart';

class DishCard extends StatelessWidget {
  final DishModel dishModel;
  const DishCard({super.key, required this.dishModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed('dishInfo', extra: dishModel),
      child: SizedBox(
        height: mq.height * .34,
        width: mq.width * .43,
        child: Column(
          children: [
            Stack(
              children: [
                // food image
                SizedBox(
                  height: mq.height * .27,
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    child: CachedNetworkImage(
                      imageUrl: dishModel.image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Center(child: CircularProgressIndicator()),
                      placeholder: (context, url) => const CustomLoading(),
                    ),
                  ),
                ),

                // add fav icon
                Positioned(
                  right: 3,
                  top: 2,
                  child:
                      //  Obx(() {
                      // final isMatching = GetData.userWishlist.contains(
                      //   dishModel.itemId,
                      // );
                      // return
                      InkWell(
                        onTap: () {
                          // isMatching
                          //     ? UpdateData.removeFromWhishList(
                          //         dishModel: dishModel,
                          //       )
                          //     : UpdateData.addToWhishList(
                          //         productId: dishModel.itemId,
                          //       );
                        },
                        child: Image.asset(
                          '$imagePath/like.png',
                          // isMatching
                          //     ? '$imagePath/like.png'
                          //     : '$imagePath/dislike.png',
                          scale: 3.3,
                        ),
                      ),
                  // }),
                ),

                // offer & ratings
                Positioned(
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: mq.width * .04,
                          vertical: mq.height * .005,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.grey.withValues(alpha: .70),
                        ),
                        child: Align(
                          child: Text(
                            "20% OFF",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: txtColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * .04),
                      Image.asset('$imagePath/star.png', scale: 4),
                      SizedBox(width: mq.width * .02),
                      Text(
                        '4.7',
                        style: TextStyle(fontSize: 12.sp, color: txtColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // name & price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: mq.width * .27,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      dishModel.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4, top: 7),
                  child: Text(
                    '₹ ${dishModel.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
