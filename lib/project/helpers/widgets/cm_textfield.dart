import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CMTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final VoidCallback onTap;
  final bool? isSuffix;

  const CMTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.enabled,
    required this.onTap,
    required this.textInputType,
    this.isSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      onTap: onTap,
      keyboardType: textInputType,
      onTapOutside: (e) => FocusScope.of(context).unfocus(),
      controller: controller,
      style: const TextStyle(fontSize: 13),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          filled: true,
          fillColor: const Color(0xffF7F7F7),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color(0xFFAEAEAE),
              fontSize: 13,
              fontWeight: FontWeight.w500),
          suffixIcon: isSuffix != null && isSuffix!
              ? const Icon(Icons.date_range)
              : null),
    );
  }
}

class CMPassTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final VoidCallback onTap;
  CMPassTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.enabled,
      required this.onTap,
      required this.textInputType});

  final obscure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        enabled: enabled,
        onTap: onTap,
        keyboardType: textInputType,
        controller: controller,
        obscureText: obscure.value,
        onTapOutside: (e) => FocusScope.of(context).unfocus(),
        style: const TextStyle(fontSize: 13),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          filled: true,
          fillColor: const Color(0xffF7F7F7),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          isDense: false,
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: () {
              obscure.value = !obscure.value;
            },
            icon: obscure.value
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          hintStyle: const TextStyle(
              color: Color(0xFFAEAEAE),
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
