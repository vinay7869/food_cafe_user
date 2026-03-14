import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/lotties/loading.gif', width: 100);
  }
}

class Hurray extends StatelessWidget {
  const Hurray({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/hurray.json',
        width: double.maxFinite, height: double.maxFinite);
  }
}
