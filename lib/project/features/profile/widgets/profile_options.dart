import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class ProfileOptions extends StatelessWidget {
  final String image, text;
  final VoidCallback onTap;
  const ProfileOptions({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: pColor.withValues(alpha: .07),
      child: Padding(
        padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .02),
        child: Row(
          children: [
            Image.asset(image, scale: 3.7),
            Padding(
              padding: EdgeInsets.only(left: mq.width * .06),
              child: Text(text),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, size: 20),
          ],
        ),
      ),
    );
  }
}
