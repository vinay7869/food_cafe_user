import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color, borderClr, textColor;
  final double? width, height, fontSize;
  final bool? isEnable;
  final bool? isLoading;
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
    this.isEnable,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? mq.width, height ?? mq.height * .057),
          backgroundColor: isEnable != null
              ? isEnable!
                    ? color
                    : const Color.fromARGB(255, 129, 127, 127)
              : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.r),
            side: BorderSide(color: borderClr ?? Colors.transparent),
          ),
        ),
        child: isLoading != null
            ? isLoading!
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: txtColor),
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        letterSpacing: .9,
                        fontWeight: FontWeight.w700,
                        color: textColor ?? txtColor,
                        fontSize: fontSize ?? 15.7.sp,
                      ),
                    )
            : Text(
                text,
                style: TextStyle(
                  letterSpacing: .9,
                  fontWeight: FontWeight.w700,
                  color: textColor ?? txtColor,
                  fontSize: fontSize ?? 15.7.sp,
                ),
              ),
      ),
    );
  }
}
