import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../helpers/widgets/custom_loading.dart';
import '../../helpers/custome_code/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.goNamed('/auth-landing-page');
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    precacheImage(const AssetImage('$imagePath/initial_bg.png'), context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('$imagePath/splash_bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Image.asset('$imagePath/logo.png', height: mq.height * .14),
            SizedBox(height: mq.height * .03),
            const Align(
              child: Text(
                appName,
                style: TextStyle(
                  color: pColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: mq.height * .2),
            const CustomLoading(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
