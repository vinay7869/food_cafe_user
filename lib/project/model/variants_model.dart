import 'package:freezed_annotation/freezed_annotation.dart';

part 'variants_model.freezed.dart';
part 'variants_model.g.dart';

@freezed
abstract class VariantsModel with _$VariantsModel {
  const factory VariantsModel({
    @Default('') String name,
    @Default(0) double price,
  }) = _VariantsModel;

  factory VariantsModel.fromJson(Map<String, dynamic> json) =>
      _$VariantsModelFromJson(json);
}
