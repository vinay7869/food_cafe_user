import 'dart:developer';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cartList = <CartItemModel>[].obs;
  RxBool isDuplicate = false.obs;
  RxDouble finalPrice = 0.0.obs;

  void addToCart({required CartItemModel item}) {
    cartList.add(
      CartItemModel(
        dishName: item.dishName,
        selectedVariantIndex: item.selectedVariantIndex,
        selectedAddonIndexes: item.selectedAddonIndexes,
        finalPrice: item.finalPrice,
        dishImage: item.dishImage,
      ),
    );

    log('mY cart -->>>  ${cartList.map((e) => e.toJson()).toList()}');
  }

  void removeFromCart(CartItemModel item) {
    cartList.removeWhere(
      (e) =>
          e.dishName == item.dishName &&
          e.selectedVariantIndex == item.selectedVariantIndex &&
          _listEquals(
            e.selectedAddonIndexes ?? [],
            item.selectedAddonIndexes ?? [],
          ),
    );

    log('My cart removed -->>> ${cartList.map((e) => e.toJson()).toList()}');
  }

  bool isItemInCart(CartItemModel item) {
    return cartList.any(
      (e) =>
          e.dishName == item.dishName &&
          e.selectedVariantIndex == item.selectedVariantIndex &&
          _listEquals(
            e.selectedAddonIndexes ?? [],
            item.selectedAddonIndexes ?? [],
          ),
    );
  }

  bool _listEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;

    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
