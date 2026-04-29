// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VariantsModel _$VariantsModelFromJson(Map<String, dynamic> json) =>
    _VariantsModel(
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$VariantsModelToJson(_VariantsModel instance) =>
    <String, dynamic>{'name': instance.name, 'price': instance.price};
