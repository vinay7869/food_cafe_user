import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/widgets/exit_dialog.dart';
import 'package:get/get.dart';

class BottomNav extends StatefulWidget {
  static const routeName = 'bottomNav';
  final int index;
  const BottomNav({super.key, required this.index});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.dialog(ExitDialog());
      },
      child: const Placeholder(),
    );
  }
}
