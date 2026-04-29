import 'package:get/get.dart';

class PriceController extends GetxController {
  RxDouble finalPrice = 0.0.obs;

  RxList<int> addonsSelected = <int>[].obs;
  RxInt selectedVariant = 0.obs;

  void calculatePrice({required List variants, required List addons}) {
    double total = 0;

    if (variants.isNotEmpty) {
      total += variants[selectedVariant.value].price;
    }

    for (var i in addonsSelected) {
      total += addons[i].price;
    }

    finalPrice.value = total;
  }
}
