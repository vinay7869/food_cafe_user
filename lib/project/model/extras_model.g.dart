// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extras_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExtrasModel _$ExtrasModelFromJson(Map<String, dynamic> json) => _ExtrasModel(
  addons:
      (json['addons'] as List<dynamic>?)
          ?.map((e) => AddonsModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => VariantsModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ExtrasModelToJson(_ExtrasModel instance) =>
    <String, dynamic>{'addons': instance.addons, 'variants': instance.variants};
