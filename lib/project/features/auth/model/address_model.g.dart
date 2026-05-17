// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  id: json['id'] as String? ?? '',
  addressLine1: json['addressLine1'] as String? ?? '',
  street: json['street'] as String? ?? '',
  city: json['city'] as String? ?? '',
  pincode: json['pincode'] as String? ?? '',
  state: json['state'] as String? ?? '',
  country: json['country'] as String? ?? '',
  addressType:
      $enumDecodeNullable(_$AddressTypeEnumMap, json['addressType']) ??
      AddressType.home,
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'id': instance.id,
  'addressLine1': instance.addressLine1,
  'street': instance.street,
  'city': instance.city,
  'pincode': instance.pincode,
  'state': instance.state,
  'country': instance.country,
  'addressType': _$AddressTypeEnumMap[instance.addressType]!,
};

const _$AddressTypeEnumMap = {
  AddressType.home: 'home',
  AddressType.work: 'work',
  AddressType.other: 'other',
};
