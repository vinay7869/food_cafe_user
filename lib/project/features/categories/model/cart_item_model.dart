import 'package:food_cafe_user/project/model/dish_model.dart';

class CartItemModel {
  final DishModel dishModel;
  final String dishName;
  final String? dishImage;
  final int? selectedVariantIndex;
  final List<int>? selectedAddonIndexes;
  final double finalPrice;
  int quantity;

  CartItemModel({
    required this.dishModel,
    required this.dishName,
    required this.selectedVariantIndex,
    required this.selectedAddonIndexes,
    required this.finalPrice,
    required this.dishImage,
    this.quantity = 1,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      dishModel: DishModel.fromJson(json['dishModel']),
      dishName: json['dishName'],
      dishImage: json['dishImage'],
      selectedVariantIndex: json['selectedVariantIndex'] ?? 0,
      selectedAddonIndexes: List<int>.from(json['selectedAddonIndexes'] ?? []),
      finalPrice: (json['finalPrice'] as num).toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dishModel': dishModel,
      'dish': dishName,
      'dishImage': dishImage,
      'selectedVariantIndex': selectedVariantIndex,
      'selectedAddonIndexes': selectedAddonIndexes,
      'finalPrice': finalPrice,
      'quantity': quantity,
    };
  }
}
