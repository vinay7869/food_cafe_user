import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class FeelContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String image, t1, t2;
  const FeelContainer({
    super.key,
    required this.onTap,
    required this.image,
    required this.t1,
    required this.t2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(onTap: onTap, child: Image.asset(image, scale: 1.7)),
        Positioned(
          bottom: mq.height * .027,
          left: mq.width * .05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t1, style: const TextStyle(fontSize: 10)),
              Text(
                t2,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
