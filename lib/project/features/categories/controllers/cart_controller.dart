import 'dart:developer';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cartList = <CartItemModel>[].obs;
  RxBool isDuplicate = false.obs;
  RxDouble finalPrice = 0.0.obs;

  void addToCart({required CartItemModel item}) {
    int index = cartList.indexWhere(
      (e) =>
          e.dishModel.id == item.dishModel.id &&
          e.selectedVariantIndex == item.selectedVariantIndex &&
          _listEquals(e.selectedAddonIndexes, item.selectedAddonIndexes),
    );

    if (index != -1) {
      cartList[index].quantity += 1;
    } else {
      cartList.add(
        CartItemModel(
          selectedVariantIndex: item.selectedVariantIndex,
          selectedAddonIndexes: List.from(item.selectedAddonIndexes ?? []),
          finalPrice: item.finalPrice,
          dishModel: item.dishModel,
          quantity: 1,
        ),
      );
    }

    log('mY cart -->>>  ${cartList.map((e) => e.toJson()).toList()}');
  }

  void removeFromCart(CartItemModel item) {
    cartList.removeWhere(
      (e) =>
          e.dishModel.name == item.dishModel.name &&
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
          e.dishModel.id == item.dishModel.id &&
          e.selectedVariantIndex == item.selectedVariantIndex &&
          _listEquals(
            e.selectedAddonIndexes ?? [],
            item.selectedAddonIndexes ?? [],
          ),
    );
  }

  bool _listEquals(List<int>? a, List<int>? b) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    if (a.length != b.length) return false;

    a.sort();
    b.sort();

    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
