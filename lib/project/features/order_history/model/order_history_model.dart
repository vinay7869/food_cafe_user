import 'package:food_cafe_user/project/features/auth/model/address_model.dart';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/custome_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_model.freezed.dart';
part 'order_history_model.g.dart';

@Freezed(fromJson: true, toJson: true)
abstract class OrderHistoryModel with _$OrderHistoryModel {
  const factory OrderHistoryModel({
    @Default('') String orderId,
    @Default('') String paymentId,
    @Default(0.0) double totalAmount,
    Address? address,
    @Default([]) List<CartItemModel> cartItems,
    @TimestampConverter() DateTime? createdAt,
    @Default('') String paymentMethod,
  }) = _OrderHistoryModel;

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);
}
