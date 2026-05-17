import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/auth/model/address_model.dart';
import 'package:food_cafe_user/project/features/profile/screens/address/address_controller.dart/address_controller.dart';
import 'package:food_cafe_user/project/features/profile/screens/address/widgets/address_bottom_sheet.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _addressController = Get.find<AddressController>();

  @override
  void initState() {
    super.initState();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    await _addressController.fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Addresses',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: mq.width * .04,
          right: mq.width * .04,
          top: mq.height * .01,
        ),
        child: Obx(
          () => Column(
            children: [
              if (_addressController.addresses.isNotEmpty)
                ..._addressController.addresses.map((e) {
                  final id = Pref.getString('defaultAdd');
                  final isDefaultAdd = e.id == id;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ListTile(
                      onTap: () {
                        _addressController.setDefaultAddress(e.id);
                        context.pop();
                      },
                      visualDensity: VisualDensity.compact,
                      tileColor: txtColor.withValues(alpha: .10),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: isDefaultAdd
                              ? pColor.withValues(alpha: .70)
                              : Colors.black26,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(17.r),
                        ),
                      ),
                      dense: true,
                      title: Text(
                        e.addressType.label,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${e.addressLine1}, ${e.street}, ${e.city}, ${e.state}, ${e.pincode}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              _addressController.setAddressType(e.addressType);
                              return AddressBottomSheet(
                                addressController: _addressController,
                                addressModel: e,
                                isEditing: true,
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: isDefaultAdd ? pColor : blackColor,
                        ),
                      ),
                    ),
                  );
                }),

              SizedBox(height: mq.height * .07),

              CustomButton(
                text: 'Add Address',
                width: 200.w,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AddressBottomSheet(
                        addressController: _addressController,
                        addressModel: Address(),
                        isEditing: false,
                      );
                    },
                  );
                },
                color: pColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
