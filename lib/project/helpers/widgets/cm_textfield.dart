import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';

class CMTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final VoidCallback onTap;
  final bool? isSuffix;
  final String? Function(String? value)? onSubmitted;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const CMTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.enabled,
    required this.onTap,
    required this.textInputType,
    this.isSuffix,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onTap: onTap,
      keyboardType: textInputType,
      onTapOutside: (e) => FocusScope.of(context).unfocus(),
      maxLength: maxLength,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatters,
      style: TextStyle(fontSize: 13.sp),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14.0),
        filled: true,
        fillColor: const Color.fromARGB(255, 244, 240, 240),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blackColor),
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 133, 132, 132),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: isSuffix != null && isSuffix!
            ? const Icon(Icons.date_range)
            : null,
      ),
    );
  }
}

class CMPassTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final VoidCallback onTap;
  final String? Function(String? value)? validator;
  CMPassTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.enabled,
    required this.onTap,
    required this.textInputType,
    this.validator,
  });

  final obscure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        enabled: enabled,
        onTap: onTap,
        keyboardType: textInputType,
        controller: controller,
        obscureText: obscure.value,
        onTapOutside: (e) => FocusScope.of(context).unfocus(),
        validator: validator,
        style: TextStyle(fontSize: 13.sp),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          filled: true,
          fillColor: const Color.fromARGB(255, 244, 240, 240),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: blackColor),
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
          ),
          isDense: false,
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: () {
              obscure.value = !obscure.value;
            },
            icon: obscure.value
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 133, 132, 132),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
