import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/cm_textfield.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$imagePath/food.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: mq.height * 0.43),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(height: 17),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 12),
                        child: Text(
                          'Log In Your Account',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFAC9191),
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: mq.width * .07,
                          right: mq.width * .07,
                          top: 10,
                        ),
                        child: CMTextfield(
                          controller: emailC,
                          hintText: 'example@gmail.com',
                          enabled: true,
                          textInputType: TextInputType.emailAddress,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: mq.height * .02),
                      Padding(
                        padding: EdgeInsets.only(
                          left: mq.width * .07,
                          right: mq.width * .07,
                        ),
                        child: CMPassTextfield(
                          controller: passwordC,
                          hintText: 'password',
                          enabled: true,
                          textInputType: TextInputType.emailAddress,
                          onTap: () {},
                        ),
                      ),

                      //
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            // onTap: () => Nav.to(const ForgotPassword()),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: mq.width * .1,
                                top: 8.0,
                                bottom: mq.height * .02,
                              ),
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //
                      Padding(
                        padding: EdgeInsets.only(
                          right: mq.width * .07,
                          left: mq.width * .07,
                        ),
                        child: CustomButton(
                          text: 'Login',
                          onTap: () {
                            // EmailAuth.signInWithEmail(
                            //   email: emailC.text,
                            //   password: passwordC.text,
                            // );
                          },
                          color: pColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don’t have an Account? ",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              // onTap: () => Nav.to(const SignUpScreen()),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: pColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          // Get.to(() => const TabsScreen());
                          // Pref.asGuest = true;
                        },
                        child: const Text(
                          "Explore As Guest",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4E1517),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
