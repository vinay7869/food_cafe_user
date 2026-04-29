import 'package:food_cafe_user/project/model/addons_model.dart';
import 'package:food_cafe_user/project/model/variants_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'extras_model.freezed.dart';
part 'extras_model.g.dart';

@freezed
abstract class ExtrasModel with _$ExtrasModel {
  const factory ExtrasModel({
    @Default([]) List<AddonsModel> addons,
    @Default([]) List<VariantsModel> variants,
  }) = _ExtrasModel;

  factory ExtrasModel.fromJson(Map<String, dynamic> json) =>
      _$ExtrasModelFromJson(json);
}
