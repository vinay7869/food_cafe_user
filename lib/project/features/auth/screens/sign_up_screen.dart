import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/auth/auth_controller/email_auth.dart';
import 'package:food_cafe_user/project/features/auth/auth_controller/google_auth.dart';
import 'package:food_cafe_user/project/helpers/custome_code/custome_code.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/custome_code/textfield_validators.dart';
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
  final nameC = TextEditingController();
  final dobC = TextEditingController();
  final phoneC = TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();

  final GoogleSignInAuth googleSignInAuth = GoogleSignInAuth();

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

  final RxBool isEnable = false.obs;

  bool toggleIsEnable() {
    final isValid =
        emailC.text.isNotEmpty &&
        passwordC.text.length >= 6 &&
        nameC.text.isNotEmpty &&
        dobC.text.isNotEmpty &&
        phoneC.text.length == 10;

    isEnable.value = isValid;
    return isValid;
  }

  DateTime parseDob(String dob) {
    final parts = dob.split('/');
    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }

  @override
  void initState() {
    super.initState();

    emailC.addListener(toggleIsEnable);
    passwordC.addListener(toggleIsEnable);
    nameC.addListener(toggleIsEnable);
    dobC.addListener(toggleIsEnable);
    phoneC.addListener(toggleIsEnable);
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
      body: Form(
        key: _signUpFormKey,
        child: ListView(
          padding: EdgeInsets.only(left: mq.width * .07, right: mq.width * .07),
          children: [
            Align(
              child: Text(
                'Create an account',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: mq.height * .06,
                bottom: mq.height * .02,
              ),
              child: CMTextfield(
                controller: nameC,
                hintText: 'Username',
                enabled: true,
                onTap: () {},
                textInputType: TextInputType.name,
                validator: (value) => Validators.name(value),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                  LengthLimitingTextInputFormatter(20),
                ],
              ),
            ),
            CMTextfield(
              controller: emailC,
              hintText: 'Email',
              enabled: true,
              onTap: () {},
              textInputType: TextInputType.emailAddress,
              validator: (value) => Validators.email(value),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.@]')),
              ],
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
                validator: (value) => Validators.password(value),
                textInputType: TextInputType.name,
              ),
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: CMDatePickerTextfield(
                controller: dobC,
                hintText: 'Date of Birth',
                enabled: false,
                onTap: () {},
                validator: (value) => Validators.dob(value),
                textInputType: TextInputType.name,
                isSuffix: true,
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
                onSubmitted: (value) {
                  phoneC.text = value!
                      .replaceFirst(RegExp(r'^\+91'), '')
                      .trim();
                  return phoneC.text;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) => Validators.phone(value),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.only(
                  top: mq.height * .03,
                  bottom: mq.height * .03,
                ),
                child: CustomButton(
                  isEnable: isEnable.value,
                  text: 'Sign Up',
                  onTap: () async {
                    final isValid =
                        _signUpFormKey.currentState?.validate() ?? false;

                    if (!isValid) return;

                    final result = await EmailAuth.createEmailAuth(
                      email: emailC.text,
                      password: passwordC.text,
                      dob: parseDob(dobC.text),
                      phoneNumber: phoneC.text,
                    );

                    if (!context.mounted) return;

                    if (result) {
                      context.go('/onbordings');
                    }
                    return;
                  },
                  color: pColor,
                ),
              ),
            ),
            Image.asset('$imagePath/or.png'),
            Padding(
              padding: EdgeInsets.only(
                top: mq.height * .04,
                bottom: mq.height * .017,
              ),
              child: InkWell(
                onTap: () async {
                  final result = await googleSignInAuth.signInWithGoogle();

                  if (!context.mounted) return;

                  if (result) {
                    context.go('/onbordings');
                  } else {
                    CustomeCode.sacffoldErrorDialog(
                      context,
                      'Google login failed',
                    );
                  }
                },
                child: Image.asset('$imagePath/google.png'),
              ),
            ),
            InkWell(onTap: () {}, child: Image.asset('$imagePath/fb.png')),
          ],
        ),
      ),
    );
  }
}
