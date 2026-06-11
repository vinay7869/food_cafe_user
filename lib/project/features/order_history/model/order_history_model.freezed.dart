// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderHistoryModel {

 String get orderId; String get paymentId; double get totalAmount; Address? get address; List<CartItemModel> get cartItems;@TimestampConverter() DateTime? get createdAt; String get paymentMethod;
/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderHistoryModelCopyWith<OrderHistoryModel> get copyWith => _$OrderHistoryModelCopyWithImpl<OrderHistoryModel>(this as OrderHistoryModel, _$identity);

  /// Serializes this OrderHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderHistoryModel&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.cartItems, cartItems)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,paymentId,totalAmount,address,const DeepCollectionEquality().hash(cartItems),createdAt,paymentMethod);

@override
String toString() {
  return 'OrderHistoryModel(orderId: $orderId, paymentId: $paymentId, totalAmount: $totalAmount, address: $address, cartItems: $cartItems, createdAt: $createdAt, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $OrderHistoryModelCopyWith<$Res>  {
  factory $OrderHistoryModelCopyWith(OrderHistoryModel value, $Res Function(OrderHistoryModel) _then) = _$OrderHistoryModelCopyWithImpl;
@useResult
$Res call({
 String orderId, String paymentId, double totalAmount, Address? address, List<CartItemModel> cartItems,@TimestampConverter() DateTime? createdAt, String paymentMethod
});


$AddressCopyWith<$Res>? get address;

}
/// @nodoc
class _$OrderHistoryModelCopyWithImpl<$Res>
    implements $OrderHistoryModelCopyWith<$Res> {
  _$OrderHistoryModelCopyWithImpl(this._self, this._then);

  final OrderHistoryModel _self;
  final $Res Function(OrderHistoryModel) _then;

/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? paymentId = null,Object? totalAmount = null,Object? address = freezed,Object? cartItems = null,Object? createdAt = freezed,Object? paymentMethod = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address?,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderHistoryModel].
extension OrderHistoryModelPatterns on OrderHistoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderHistoryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String paymentId,  double totalAmount,  Address? address,  List<CartItemModel> cartItems, @TimestampConverter()  DateTime? createdAt,  String paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
return $default(_that.orderId,_that.paymentId,_that.totalAmount,_that.address,_that.cartItems,_that.createdAt,_that.paymentMethod);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String paymentId,  double totalAmount,  Address? address,  List<CartItemModel> cartItems, @TimestampConverter()  DateTime? createdAt,  String paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _OrderHistoryModel():
return $default(_that.orderId,_that.paymentId,_that.totalAmount,_that.address,_that.cartItems,_that.createdAt,_that.paymentMethod);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String paymentId,  double totalAmount,  Address? address,  List<CartItemModel> cartItems, @TimestampConverter()  DateTime? createdAt,  String paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
return $default(_that.orderId,_that.paymentId,_that.totalAmount,_that.address,_that.cartItems,_that.createdAt,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderHistoryModel implements OrderHistoryModel {
  const _OrderHistoryModel({this.orderId = '', this.paymentId = '', this.totalAmount = 0.0, this.address, final  List<CartItemModel> cartItems = const [], @TimestampConverter() this.createdAt, this.paymentMethod = ''}): _cartItems = cartItems;
  factory _OrderHistoryModel.fromJson(Map<String, dynamic> json) => _$OrderHistoryModelFromJson(json);

@override@JsonKey() final  String orderId;
@override@JsonKey() final  String paymentId;
@override@JsonKey() final  double totalAmount;
@override final  Address? address;
 final  List<CartItemModel> _cartItems;
@override@JsonKey() List<CartItemModel> get cartItems {
  if (_cartItems is EqualUnmodifiableListView) return _cartItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartItems);
}

@override@TimestampConverter() final  DateTime? createdAt;
@override@JsonKey() final  String paymentMethod;

/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderHistoryModelCopyWith<_OrderHistoryModel> get copyWith => __$OrderHistoryModelCopyWithImpl<_OrderHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderHistoryModel&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._cartItems, _cartItems)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,paymentId,totalAmount,address,const DeepCollectionEquality().hash(_cartItems),createdAt,paymentMethod);

@override
String toString() {
  return 'OrderHistoryModel(orderId: $orderId, paymentId: $paymentId, totalAmount: $totalAmount, address: $address, cartItems: $cartItems, createdAt: $createdAt, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$OrderHistoryModelCopyWith<$Res> implements $OrderHistoryModelCopyWith<$Res> {
  factory _$OrderHistoryModelCopyWith(_OrderHistoryModel value, $Res Function(_OrderHistoryModel) _then) = __$OrderHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String paymentId, double totalAmount, Address? address, List<CartItemModel> cartItems,@TimestampConverter() DateTime? createdAt, String paymentMethod
});


@override $AddressCopyWith<$Res>? get address;

}
/// @nodoc
class __$OrderHistoryModelCopyWithImpl<$Res>
    implements _$OrderHistoryModelCopyWith<$Res> {
  __$OrderHistoryModelCopyWithImpl(this._self, this._then);

  final _OrderHistoryModel _self;
  final $Res Function(_OrderHistoryModel) _then;

/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? paymentId = null,Object? totalAmount = null,Object? address = freezed,Object? cartItems = null,Object? createdAt = freezed,Object? paymentMethod = null,}) {
  return _then(_OrderHistoryModel(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address?,cartItems: null == cartItems ? _self._cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
