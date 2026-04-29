import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class CategoryCard extends StatelessWidget {
  final String img, dishName;
  final void Function() onTap;
  const CategoryCard({
    super.key,
    required this.img,
    required this.dishName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 220.h,
        width: mq.width * .43,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    CircularProgressIndicator.adaptive(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: .70),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Align(
                  child: Text(
                    "$dishName Cuisine",
                    style: TextStyle(
                      color: txtColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
