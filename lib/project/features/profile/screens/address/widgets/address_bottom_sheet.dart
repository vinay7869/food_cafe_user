import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_cafe_user/project/features/auth/model/address_model.dart';
import 'package:food_cafe_user/project/features/profile/screens/address/address_controller.dart/address_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/cm_textfield.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_loading.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class AddressBottomSheet extends StatefulWidget {
  final AddressController addressController;
  final Address addressModel;
  final bool isEditing;
  const AddressBottomSheet({
    super.key,
    required this.addressController,
    required this.addressModel,
    required this.isEditing,
  });

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  final addressC = TextEditingController();
  final streetC = TextEditingController();
  final stateC = TextEditingController();
  final cityC = TextEditingController();
  final pincodeC = TextEditingController();
  final countryC = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setValues());
  }

  @override
  void dispose() {
    super.dispose();
    addressC.dispose();
    streetC.dispose();
    stateC.dispose();
    cityC.dispose();
    pincodeC.dispose();
    countryC.dispose();
  }

  void setValues() {
    if (widget.isEditing) {
      addressC.text = widget.addressModel.addressLine1;
      streetC.text = widget.addressModel.street;
      stateC.text = widget.addressModel.state;
      cityC.text = widget.addressModel.city;
      pincodeC.text = widget.addressModel.pincode;
      countryC.text = widget.addressModel.country;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          // main content
          Container(
            padding: EdgeInsets.only(
              left: mq.width * .04,
              right: mq.width * .04,
              top: mq.height * .02,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: txtColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(27.r),
                topRight: Radius.circular(27.r),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //
                  _chipAddType(widget.addressController),

                  //
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address Line 1',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ).paddingOnly(top: 7.h, bottom: 7.h),
                      SizedBox(
                        height: 40.h,
                        child: CMTextfield(
                          controller: addressC,
                          hintText: '',
                          onTap: () {},
                          textInputType: TextInputType.text,
                        ),
                      ),
                      //
                      Text(
                        'Street / Area',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ).paddingOnly(top: 7.h, bottom: 7.h),
                      SizedBox(
                        height: 40.h,
                        child: CMTextfield(
                          controller: streetC,
                          hintText: '',
                          onTap: () {},
                          textInputType: TextInputType.text,
                        ),
                      ),
                      //
                      Row(
                        children: [
                          //
                          Text(
                            'Pincode',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ).paddingOnly(right: 7.w),
                          SizedBox(
                            width: 90.w,
                            height: 40.h,
                            child: CMTextfield(
                              onChanged: (value) async {
                                if (value != null && value.length == 6) {
                                  await widget.addressController
                                      .fetchStateAndCity(value);
                                  if (widget
                                      .addressController
                                      .isApiSuccess
                                      .value) {
                                    countryC.text = widget
                                        .addressController
                                        .addressModel
                                        .value!
                                        .country;
                                    stateC.text = widget
                                        .addressController
                                        .addressModel
                                        .value!
                                        .state;
                                    cityC.text = widget
                                        .addressController
                                        .addressModel
                                        .value!
                                        .city;
                                  } else {
                                    log('iadar aa brta');
                                    Fluttertoast.showToast(
                                      msg: 'Invaid Pincode',
                                      toastLength: Toast.LENGTH_SHORT,
                                    );
                                  }
                                }
                              },

                              controller: pincodeC,
                              hintText: '',
                              onTap: () {},
                              textInputType: TextInputType.number,
                            ),
                          ),
                          //
                          Text(
                            'Country',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ).paddingOnly(right: 7.w, left: 5.w),
                          Expanded(
                            child: CMTextfield(
                              controller: countryC,
                              readOnly: true,
                              suffixIcon:
                                  widget.addressController.isApiSuccess.value ||
                                      pincodeC.text.length == 6
                                  ? Icon(Icons.lock)
                                  : null,
                              hintText: '',
                              onTap: () {},
                              textInputType: TextInputType.text,
                            ),
                          ),
                        ],
                      ).paddingOnly(top: 17.h, bottom: 7.h),

                      //
                      Text(
                        'State',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ).paddingOnly(top: 10.h, bottom: 7.h),
                      SizedBox(
                        width: 170.w,
                        height: 40.h,
                        child: CMTextfield(
                          controller: stateC,
                          readOnly: true,
                          suffixIcon:
                              widget.addressController.isApiSuccess.value ||
                                  pincodeC.text.length == 6
                              ? Icon(Icons.lock)
                              : null,
                          hintText: '',
                          onTap: () {},
                          textInputType: TextInputType.text,
                        ),
                      ),

                      //
                      //
                      Text(
                        'City',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ).paddingOnly(top: 17.h, bottom: 7.h),
                      SizedBox(
                        width: 170.w,
                        height: 40.h,
                        child: CMTextfield(
                          readOnly: true,
                          suffixIcon:
                              widget.addressController.isApiSuccess.value ||
                                  pincodeC.text.length == 6
                              ? Icon(Icons.lock)
                              : null,
                          controller: cityC,
                          hintText: '',
                          onTap: () {},
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),

                  //
                  CustomButton(
                    text: widget.isEditing ? 'Update' : 'Add',
                    color: pColor,
                    width: 120.w,
                    onTap: () async {
                      if (widget.isEditing) {
                        final address = Address(
                          id: widget.addressModel.id,
                          addressLine1: addressC.text.trim(),
                          street: streetC.text.trim(),
                          state: stateC.text.trim(),
                          city: cityC.text.trim(),
                          pincode: pincodeC.text.trim(),
                          country: countryC.text.trim(),
                          addressType: widget
                              .addressController
                              .selectedAddressType
                              .value,
                        );

                        await widget.addressController.updateAddress(
                          address,
                          widget.addressModel.id,
                        );
                      } else {
                        final address = Address(
                          id: Uuid().v4(),
                          addressLine1: addressC.text.trim(),
                          street: streetC.text.trim(),
                          state: stateC.text.trim(),
                          city: cityC.text.trim(),
                          pincode: pincodeC.text.trim(),
                          country: countryC.text.trim(),
                          addressType: widget
                              .addressController
                              .selectedAddressType
                              .value,
                        );

                        await widget.addressController.addAddress(address);
                      }

                      if (!context.mounted) return;
                      context.pop(true);
                    },
                  ).paddingOnly(bottom: 15.h, top: 7.h),
                ],
              ),
            ),
          ),

          //  Loader
          widget.addressController.isLoading.value
              ? CustomLoader2()
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

Widget _chipAddType(AddressController addressController) {
  return Wrap(
    alignment: WrapAlignment.spaceAround,
    spacing: 10.w,
    runSpacing: 10.w,
    children: AddressType.values.mapIndexed((i, e) {
      final isSelected = addressController.selectedAddressType.value == e;
      return InkWell(
        onTap: () => addressController.selectedAddressType(e),
        child: Chip(
          label: Text(
            e.label,
            style: TextStyle(color: isSelected ? pColor : blackColor),
          ),
          avatar: Icon(e.icon, color: isSelected ? pColor : blackColor),
          elevation: 7,
          backgroundColor: Colors.transparent,
          side: BorderSide(
            width: isSelected ? 1 : 0.1,
            strokeAlign: 7,
            color: addressController.selectedAddressType.value == e
                ? blackColor
                : Colors.transparent,
          ),
        ),
      );
    }).toList(),
  );
}
