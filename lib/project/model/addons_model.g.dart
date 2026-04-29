// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddonsModel _$AddonsModelFromJson(Map<String, dynamic> json) => _AddonsModel(
  name: json['name'] as String? ?? '',
  price: (json['price'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$AddonsModelToJson(_AddonsModel instance) =>
    <String, dynamic>{'name': instance.name, 'price': instance.price};
