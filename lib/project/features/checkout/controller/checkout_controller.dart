import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final cartController = Get.find<CartController>();
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
}
