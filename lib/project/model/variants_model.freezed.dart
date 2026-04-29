// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variants_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VariantsModel {

 String get name; double get price;
/// Create a copy of VariantsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantsModelCopyWith<VariantsModel> get copyWith => _$VariantsModelCopyWithImpl<VariantsModel>(this as VariantsModel, _$identity);

  /// Serializes this VariantsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price);

@override
String toString() {
  return 'VariantsModel(name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class $VariantsModelCopyWith<$Res>  {
  factory $VariantsModelCopyWith(VariantsModel value, $Res Function(VariantsModel) _then) = _$VariantsModelCopyWithImpl;
@useResult
$Res call({
 String name, double price
});




}
/// @nodoc
class _$VariantsModelCopyWithImpl<$Res>
    implements $VariantsModelCopyWith<$Res> {
  _$VariantsModelCopyWithImpl(this._self, this._then);

  final VariantsModel _self;
  final $Res Function(VariantsModel) _then;

/// Create a copy of VariantsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? price = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VariantsModel].
extension VariantsModelPatterns on VariantsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VariantsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VariantsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VariantsModel value)  $default,){
final _that = this;
switch (_that) {
case _VariantsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VariantsModel value)?  $default,){
final _that = this;
switch (_that) {
case _VariantsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VariantsModel() when $default != null:
return $default(_that.name,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double price)  $default,) {final _that = this;
switch (_that) {
case _VariantsModel():
return $default(_that.name,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double price)?  $default,) {final _that = this;
switch (_that) {
case _VariantsModel() when $default != null:
return $default(_that.name,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VariantsModel implements VariantsModel {
  const _VariantsModel({this.name = '', this.price = 0});
  factory _VariantsModel.fromJson(Map<String, dynamic> json) => _$VariantsModelFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  double price;

/// Create a copy of VariantsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantsModelCopyWith<_VariantsModel> get copyWith => __$VariantsModelCopyWithImpl<_VariantsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price);

@override
String toString() {
  return 'VariantsModel(name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class _$VariantsModelCopyWith<$Res> implements $VariantsModelCopyWith<$Res> {
  factory _$VariantsModelCopyWith(_VariantsModel value, $Res Function(_VariantsModel) _then) = __$VariantsModelCopyWithImpl;
@override @useResult
$Res call({
 String name, double price
});




}
/// @nodoc
class __$VariantsModelCopyWithImpl<$Res>
    implements _$VariantsModelCopyWith<$Res> {
  __$VariantsModelCopyWithImpl(this._self, this._then);

  final _VariantsModel _self;
  final $Res Function(_VariantsModel) _then;

/// Create a copy of VariantsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? price = null,}) {
  return _then(_VariantsModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
