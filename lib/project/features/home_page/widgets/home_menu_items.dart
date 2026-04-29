import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class HomeMenuItems extends StatelessWidget {
  final String img, cName;
  const HomeMenuItems({super.key, required this.img, required this.cName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mq.height * .167,
      child: InkWell(
        onTap: () {
          // Get.to(() => DishList(cuisineName: cName));
        },
        child: Column(
          children: [
            SizedBox(
              height: mq.height * .12,
              child: Image.asset(img, fit: BoxFit.fill),
            ),
            SizedBox(height: mq.height * .01),
            Text(cName),
          ],
        ),
      ),
    );
  }
}
