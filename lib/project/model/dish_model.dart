import 'package:food_cafe_user/project/helpers/custome_code/custome_code.dart';
import 'package:food_cafe_user/project/model/extras_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_model.freezed.dart';
part 'dish_model.g.dart';

@Freezed(fromJson: true, toJson: true)

abstract class DishModel with _$DishModel {
  const factory DishModel({
    String? id,
    @Default('') String name,
    @Default(0) double price,
    @Default(true) bool isVeg,
    @Default('') String image,
    @Default(0) double rating,
    @Default(true) bool inStock,
    @Default(false) bool isPopularToday,
    @TimestampConverter() DateTime? createdAt,
    ExtrasModel? extras,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
}
