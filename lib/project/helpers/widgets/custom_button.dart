import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color, borderClr, textColor;
  final double? width, height, fontSize;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.width,
    this.height,
    this.fontSize,
    this.borderClr,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? mq.width, height ?? mq.height * .057),
          backgroundColor: color ?? txtColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
            side: BorderSide(color: borderClr ?? Colors.transparent),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            letterSpacing: .9,
            fontWeight: FontWeight.w700,
            color: textColor ?? txtColor,
            fontSize: fontSize ?? 15.7,
          ),
        ),
      ),
    );
  }
}
