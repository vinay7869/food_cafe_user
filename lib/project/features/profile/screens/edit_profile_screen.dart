import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/profile/controllers/profile_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/custome_code.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/custome_code/textfield_validators.dart';
import 'package:food_cafe_user/project/helpers/widgets/cm_textfield.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileController _profileController = Get.find<ProfileController>();

  final _editUserFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final DateTime lastDate = DateTime(now.year - 10, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: lastDate,
      firstDate: DateTime(1900),
      lastDate: lastDate,
    );

    if (picked != null && picked != DateTime.now()) {
      dobController.text = '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = _profileController.user.value.name;
      emailController.text = _profileController.user.value.email;
      if (_profileController.user.value.dob != null) {
        dobController.text =
            '${_profileController.user.value.dob!.day}/${_profileController.user.value.dob!.month}/${_profileController.user.value.dob!.year}';
      } else {
        dobController.text = '';
      }

      phoneController.text = _profileController.user.value.phone;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        _profileController.image.value = null;
        context.pop();
      },
      child: Scaffold(
        // app bar
        appBar: AppBar(
          title: Text(
            'Edit Profile',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () {
              _profileController.image.value = null;
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),

        //
        body: ListView(
          padding: EdgeInsets.only(
            left: mq.width * .04,
            right: mq.width * .04,
            top: 10.h,
          ),
          children: [
            // profile image
            SizedBox(
              height: mq.height * .18,
              child: Stack(
                children: [
                  Align(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      child: SizedBox(
                        height: mq.height * .17,
                        width: mq.height * .17,
                        child: Obx(
                          () => _profileController.image.value != null
                              ? ClipOval(
                                  child: Image.file(
                                    File(_profileController.image.value!.path),
                                    width: 120.w,
                                    height: 120.h,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : _profileController
                                    .user
                                    .value
                                    .profilePic
                                    .isNotEmpty
                              ? CachedNetworkImage(
                                  imageUrl:
                                      _profileController.user.value.profilePic,
                                  placeholder: (context, url) => CircleAvatar(
                                    radius: 100.r,
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('$profilePath/me.png'),
                                  fit: BoxFit.cover,
                                )
                              : Image.asset('$profilePath/me.png'),
                        ),
                      ),
                    ),
                  ),

                  // image picker
                  Positioned(
                    bottom: 10,
                    right: mq.width * .3,
                    child: InkWell(
                      onTap: () => _profileController.pickImage(),
                      child: Image.asset(
                        '$profilePath/gallery.png',
                        scale: 3.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: mq.height * .05),

            //  text fields
            Form(
              key: _editUserFormKey,
              child: Column(
                children:
                    [
                          // name
                          CMTextfield(
                            controller: nameController,
                            hintText: 'Name',
                            enabled: true,
                            onTap: () {},
                            textInputType: TextInputType.name,
                            validator: (value) => Validators.name(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z ]'),
                              ),
                              LengthLimitingTextInputFormatter(20),
                            ],
                          ),

                          // DOB
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: mq.height * .03,
                            ),
                            child: InkWell(
                              onTap: () => _selectDate(context),
                              child: CMDatePickerTextfield(
                                controller: dobController,
                                hintText: 'Date of Birth',
                                enabled: false,
                                onTap: () {},
                                isSuffix: true,
                                textInputType: TextInputType.name,
                              ),
                            ),
                          ),

                          // email
                          AbsorbPointer(
                            child: CMTextfield(
                              controller: emailController,
                              hintText: 'Email Address',
                              suffixIcon: Icon(Icons.lock),
                              onTap: () {},
                              textInputType: TextInputType.emailAddress,
                            ),
                          ),

                          //  phone number
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: mq.height * .03,
                            ),
                            child:
                                _profileController.user.value.phone.isNotEmpty
                                ? AbsorbPointer(
                                    child: CMTextfield(
                                      controller: phoneController,
                                      hintText: 'Phone Number',
                                      suffixIcon: Icon(Icons.lock),
                                      onTap: () {},
                                      textInputType: TextInputType.phone,
                                    ),
                                  )
                                : CMTextfield(
                                    controller: phoneController,
                                    hintText: 'Phone Number',
                                    onTap: () {},
                                    onSubmitted: (value) {
                                      phoneController.text = value!
                                          .replaceFirst(RegExp(r'^\+91'), '')
                                          .trim();
                                      return phoneController.text;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    textInputType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.length != 10) {
                                        return 'Please enter 10 digit number';
                                      }
                                      return null;
                                    },
                                  ),
                          ),

                          //  save btn
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(top: mq.height * .04),
                              child: CustomButton(
                                text: 'Save',
                                isLoading: _profileController.isLoading.value,
                                onTap: () async {
                                  _profileController.isLoading.value = true;

                                  if (nameController.text.isEmpty ||
                                      (phoneController.text.length != 10 &&
                                          phoneController.text.isNotEmpty)) {
                                    _profileController.isLoading.value = false;
                                    return;
                                  }

                                  final Map<String, dynamic> data = {};

                                  data['name'] = nameController.text.trim();
                                  data['phone'] = phoneController.text;

                                  if (dobController.text.isNotEmpty) {
                                    final dob = DateFormat(
                                      'd/M/yyyy',
                                    ).parse(dobController.text);

                                    data['dob'] = Timestamp.fromDate(dob);
                                  }

                                  if (_profileController.image.value != null) {
                                    final profilePic = await _profileController
                                        .uploadToFirebase(
                                          _profileController.image.value!.path,
                                        );

                                    if (profilePic != null) {
                                      data['profilePic'] = profilePic;
                                    } else {
                                      if (!context.mounted) return;
                                      CustomeCode.sacffoldErrorDialog(
                                        context,
                                        'Failed to upload file',
                                      );
                                    }
                                  }

                                  await _profileController.updateUser(data);

                                  _profileController.image.value = null;

                                  if (!context.mounted) return;
                                  context.pop();
                                },
                                color: pColor,
                              ),
                            ),
                          ),
                        ]
                        .animate(interval: const Duration(milliseconds: 100))
                        .fadeIn(duration: const Duration(milliseconds: 200))
                        .slideY(duration: const Duration(milliseconds: 600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
