import 'package:freezed_annotation/freezed_annotation.dart';

part 'addons_model.freezed.dart';
part 'addons_model.g.dart';

@freezed
abstract class AddonsModel with _$AddonsModel {
  const factory AddonsModel({
    @Default('') String name,
    @Default(0) double price,
  }) = _AddonsModel;

  factory AddonsModel.fromJson(Map<String, dynamic> json) =>
      _$AddonsModelFromJson(json);
}
