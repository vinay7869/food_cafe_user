// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DishModel _$DishModelFromJson(Map<String, dynamic> json) => _DishModel(
  id: json['id'] as String?,
  name: json['name'] as String? ?? '',
  price: (json['price'] as num?)?.toDouble() ?? 0,
  isVeg: json['isVeg'] as bool? ?? true,
  image: json['image'] as String? ?? '',
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  inStock: json['inStock'] as bool? ?? true,
  isPopularToday: json['isPopularToday'] as bool? ?? false,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  extras: json['extras'] == null
      ? null
      : ExtrasModel.fromJson(json['extras'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DishModelToJson(_DishModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'isVeg': instance.isVeg,
      'image': instance.image,
      'rating': instance.rating,
      'inStock': instance.inStock,
      'isPopularToday': instance.isPopularToday,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'extras': instance.extras,
    };
