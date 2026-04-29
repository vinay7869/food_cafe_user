// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DishModel {

 String? get id; String get name; double get price; bool get isVeg; String get image; double get rating; bool get inStock; bool get isPopularToday;@TimestampConverter() DateTime? get createdAt; ExtrasModel? get extras;
/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DishModelCopyWith<DishModel> get copyWith => _$DishModelCopyWithImpl<DishModel>(this as DishModel, _$identity);

  /// Serializes this DishModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DishModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isVeg, isVeg) || other.isVeg == isVeg)&&(identical(other.image, image) || other.image == image)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.isPopularToday, isPopularToday) || other.isPopularToday == isPopularToday)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.extras, extras) || other.extras == extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isVeg,image,rating,inStock,isPopularToday,createdAt,extras);

@override
String toString() {
  return 'DishModel(id: $id, name: $name, price: $price, isVeg: $isVeg, image: $image, rating: $rating, inStock: $inStock, isPopularToday: $isPopularToday, createdAt: $createdAt, extras: $extras)';
}


}

/// @nodoc
abstract mixin class $DishModelCopyWith<$Res>  {
  factory $DishModelCopyWith(DishModel value, $Res Function(DishModel) _then) = _$DishModelCopyWithImpl;
@useResult
$Res call({
 String? id, String name, double price, bool isVeg, String image, double rating, bool inStock, bool isPopularToday,@TimestampConverter() DateTime? createdAt, ExtrasModel? extras
});


$ExtrasModelCopyWith<$Res>? get extras;

}
/// @nodoc
class _$DishModelCopyWithImpl<$Res>
    implements $DishModelCopyWith<$Res> {
  _$DishModelCopyWithImpl(this._self, this._then);

  final DishModel _self;
  final $Res Function(DishModel) _then;

/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? price = null,Object? isVeg = null,Object? image = null,Object? rating = null,Object? inStock = null,Object? isPopularToday = null,Object? createdAt = freezed,Object? extras = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isVeg: null == isVeg ? _self.isVeg : isVeg // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,isPopularToday: null == isPopularToday ? _self.isPopularToday : isPopularToday // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,extras: freezed == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as ExtrasModel?,
  ));
}
/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtrasModelCopyWith<$Res>? get extras {
    if (_self.extras == null) {
    return null;
  }

  return $ExtrasModelCopyWith<$Res>(_self.extras!, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}


/// Adds pattern-matching-related methods to [DishModel].
extension DishModelPatterns on DishModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DishModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DishModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DishModel value)  $default,){
final _that = this;
switch (_that) {
case _DishModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DishModel value)?  $default,){
final _that = this;
switch (_that) {
case _DishModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  double price,  bool isVeg,  String image,  double rating,  bool inStock,  bool isPopularToday, @TimestampConverter()  DateTime? createdAt,  ExtrasModel? extras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DishModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isVeg,_that.image,_that.rating,_that.inStock,_that.isPopularToday,_that.createdAt,_that.extras);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  double price,  bool isVeg,  String image,  double rating,  bool inStock,  bool isPopularToday, @TimestampConverter()  DateTime? createdAt,  ExtrasModel? extras)  $default,) {final _that = this;
switch (_that) {
case _DishModel():
return $default(_that.id,_that.name,_that.price,_that.isVeg,_that.image,_that.rating,_that.inStock,_that.isPopularToday,_that.createdAt,_that.extras);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  double price,  bool isVeg,  String image,  double rating,  bool inStock,  bool isPopularToday, @TimestampConverter()  DateTime? createdAt,  ExtrasModel? extras)?  $default,) {final _that = this;
switch (_that) {
case _DishModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isVeg,_that.image,_that.rating,_that.inStock,_that.isPopularToday,_that.createdAt,_that.extras);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DishModel implements DishModel {
  const _DishModel({this.id, this.name = '', this.price = 0, this.isVeg = true, this.image = '', this.rating = 0, this.inStock = true, this.isPopularToday = false, @TimestampConverter() this.createdAt, this.extras});
  factory _DishModel.fromJson(Map<String, dynamic> json) => _$DishModelFromJson(json);

@override final  String? id;
@override@JsonKey() final  String name;
@override@JsonKey() final  double price;
@override@JsonKey() final  bool isVeg;
@override@JsonKey() final  String image;
@override@JsonKey() final  double rating;
@override@JsonKey() final  bool inStock;
@override@JsonKey() final  bool isPopularToday;
@override@TimestampConverter() final  DateTime? createdAt;
@override final  ExtrasModel? extras;

/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DishModelCopyWith<_DishModel> get copyWith => __$DishModelCopyWithImpl<_DishModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DishModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DishModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isVeg, isVeg) || other.isVeg == isVeg)&&(identical(other.image, image) || other.image == image)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.isPopularToday, isPopularToday) || other.isPopularToday == isPopularToday)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.extras, extras) || other.extras == extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isVeg,image,rating,inStock,isPopularToday,createdAt,extras);

@override
String toString() {
  return 'DishModel(id: $id, name: $name, price: $price, isVeg: $isVeg, image: $image, rating: $rating, inStock: $inStock, isPopularToday: $isPopularToday, createdAt: $createdAt, extras: $extras)';
}


}

/// @nodoc
abstract mixin class _$DishModelCopyWith<$Res> implements $DishModelCopyWith<$Res> {
  factory _$DishModelCopyWith(_DishModel value, $Res Function(_DishModel) _then) = __$DishModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, double price, bool isVeg, String image, double rating, bool inStock, bool isPopularToday,@TimestampConverter() DateTime? createdAt, ExtrasModel? extras
});


@override $ExtrasModelCopyWith<$Res>? get extras;

}
/// @nodoc
class __$DishModelCopyWithImpl<$Res>
    implements _$DishModelCopyWith<$Res> {
  __$DishModelCopyWithImpl(this._self, this._then);

  final _DishModel _self;
  final $Res Function(_DishModel) _then;

/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? price = null,Object? isVeg = null,Object? image = null,Object? rating = null,Object? inStock = null,Object? isPopularToday = null,Object? createdAt = freezed,Object? extras = freezed,}) {
  return _then(_DishModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isVeg: null == isVeg ? _self.isVeg : isVeg // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,isPopularToday: null == isPopularToday ? _self.isPopularToday : isPopularToday // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,extras: freezed == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as ExtrasModel?,
  ));
}

/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtrasModelCopyWith<$Res>? get extras {
    if (_self.extras == null) {
    return null;
  }

  return $ExtrasModelCopyWith<$Res>(_self.extras!, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}

// dart format on
