// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    _OrderHistoryModel(
      orderId: json['orderId'] as String? ?? '',
      paymentId: json['paymentId'] as String? ?? '',
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      cartItems:
          (json['cartItems'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      paymentMethod: json['paymentMethod'] as String? ?? '',
    );

Map<String, dynamic> _$OrderHistoryModelToJson(_OrderHistoryModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentId': instance.paymentId,
      'totalAmount': instance.totalAmount,
      'address': instance.address?.toJson(),
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'paymentMethod': instance.paymentMethod,
    };
