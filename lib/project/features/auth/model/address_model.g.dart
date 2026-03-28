// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  street: json['street'] as String? ?? '',
  city: json['city'] as String? ?? '',
  pincode: json['pincode'] as String? ?? '',
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'street': instance.street,
  'city': instance.city,
  'pincode': instance.pincode,
};
