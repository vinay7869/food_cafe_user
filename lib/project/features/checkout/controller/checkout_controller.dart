import 'package:food_cafe_user/project/features/auth/model/address_model.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/profile/controllers/profile_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final cartController = Get.find<CartController>();
  final ProfileController profileController = Get.find<ProfileController>();
  Address? defaultAdd;

  final toPay = 0.0.obs;
  final totalAmount = 0.0.obs;
  final deliveryCharge = 30;
  final gst = 3;

  void calculateTotal() {
    totalAmount.value = cartController.cartList.fold(
      0,
      (previousValue, element) =>
          previousValue + (element.finalPrice * element.quantity),
    );

    calculateToPay();
  }

  void calculateToPay() {
    final gstAmount = totalAmount.value * gst / 100;
    toPay.value = totalAmount.value + deliveryCharge + gstAmount;
  }

  Future<Address?> fetchDefaultAdd() async {
    final id = Pref.getString('defaultAdd');
    final addresses = profileController.user.value.address;

    if (addresses.isEmpty || id == null) return null;

    try {
      defaultAdd = addresses.firstWhere((element) => element.id == id);
      return defaultAdd;
    } catch (e) {
      return null;
    }
  }
}
