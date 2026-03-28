import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  final BottomNavController c;

  const BottomNav({super.key, required this.c});

  // @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: pColor),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['Categories', 'Home', 'Profile']
                .mapIndexed(
                  (i, e) => InkWell(
                    radius: 1,
                    onTap: () => c.i.value = i,
                    child: Column(
                      children: [
                        Container(
                          height: 3.h,
                          width: 70.w,
                          color: c.i.value == i ? txtColor : Colors.transparent,
                        ),
                        SizedBox(height: mq.height * .02),
                        Image.asset(
                          c.i.value == i
                              ? '$imagePath/${e}_h.png'
                              : '$imagePath/$e.png',
                          width: 27,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
