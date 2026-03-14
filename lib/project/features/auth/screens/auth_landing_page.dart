import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthLandingPage extends StatefulWidget {
  static const String routeName = '/auth-landing-page';
  const AuthLandingPage({super.key});

  @override
  State<AuthLandingPage> createState() => _AuthLandingPageState();
}

class _AuthLandingPageState extends State<AuthLandingPage> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('$imagePath/initial_bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: mq.width * .07, right: mq.width * .07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: mq.width * .23),
                child: Text(
                  "Delicious Meals Brought Directly To Your Home.",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: txtColor,
                  ),
                ),
              ),
              SizedBox(height: mq.height * .34),
              CustomButton(
                text: 'Login',
                onTap: () => context.pushNamed('/login-screen'),
                color: pColor,
                height: 8,
                fontSize: 13,
              ),

              SizedBox(height: mq.height * .02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an Account?',
                    style: TextStyle(color: txtColor.withValues(alpha: .8)),
                  ),
                  TextButton(
                    onPressed: () => context.pushNamed('/sign-up'),
                    child: const Text(
                      'Sign Up!',
                      style: TextStyle(color: txtColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
