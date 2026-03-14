import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/cm_textfield.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  static final nameC = TextEditingController();
  static final dobC = TextEditingController();
  final phoneC = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      dobC.text = '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(  
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: mq.width * .07, right: mq.width * .07),
        children: [
          const Align(
            child: Text(
              'Create an account',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mq.height * .06,
              bottom: mq.height * .02,
            ),
            child: CMTextfield(
              controller: nameC,
              hintText: 'username',
              enabled: true,
              onTap: () {},
              textInputType: TextInputType.name,
            ),
          ),
          CMTextfield(
            controller: emailC,
            hintText: 'Email',
            enabled: true,
            onTap: () {},
            textInputType: TextInputType.emailAddress,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mq.height * .02,
              bottom: mq.height * .02,
            ),
            child: CMPassTextfield(
              controller: passwordC,
              hintText: 'Password',
              enabled: true,
              onTap: () {},
              textInputType: TextInputType.name,
            ),
          ),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: CMTextfield(
              controller: dobC,
              hintText: 'Date of Birth',
              enabled: false,
              onTap: () {},
              textInputType: TextInputType.name,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mq.height * .02,
              bottom: mq.height * .02,
            ),
            child: CMTextfield(
              controller: phoneC,
              hintText: 'Phone',
              enabled: true,
              onTap: () {},
              textInputType: TextInputType.phone,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mq.height * .03,
              bottom: mq.height * .03,
            ),
            child: CustomButton(
              text: 'Sign Up',
              onTap: () {
                // EmailAuth.emailAuth(
                //     email: emailC.text, password: passwordC.text);
              },
              color: pColor,
            ),
          ),
          Image.asset('$imagePath/or.png'),
          Padding(
            padding: EdgeInsets.only(
              top: mq.height * .04,
              bottom: mq.height * .017,
            ),
            child: InkWell(
              onTap: () {
                // GoogleAuth.signInWithGoogle();
              },
              child: Image.asset('$imagePath/google.png'),
            ),
          ),
          InkWell(onTap: () {}, child: Image.asset('$imagePath/fb.png')),
        ],
      ),
    );
  }
}
