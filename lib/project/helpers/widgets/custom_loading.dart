import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/lotties/loading.gif', width: 100);
  }
}

class CustomLoader2 extends StatelessWidget {
  const CustomLoader2({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Column(
        children: [
          Center(child: CircularProgressIndicator()),
          Container(color: Colors.black.withValues(alpha: 0.2)),
        ],
      ),
    );
  }
}

class Hurray extends StatelessWidget {
  const Hurray({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/hurray.json',
      width: double.maxFinite,
      height: double.maxFinite,
    );
  }
}
