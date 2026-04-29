// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extras_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExtrasModel {

 List<AddonsModel> get addons; List<VariantsModel> get variants;
/// Create a copy of ExtrasModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtrasModelCopyWith<ExtrasModel> get copyWith => _$ExtrasModelCopyWithImpl<ExtrasModel>(this as ExtrasModel, _$identity);

  /// Serializes this ExtrasModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtrasModel&&const DeepCollectionEquality().equals(other.addons, addons)&&const DeepCollectionEquality().equals(other.variants, variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(addons),const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'ExtrasModel(addons: $addons, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $ExtrasModelCopyWith<$Res>  {
  factory $ExtrasModelCopyWith(ExtrasModel value, $Res Function(ExtrasModel) _then) = _$ExtrasModelCopyWithImpl;
@useResult
$Res call({
 List<AddonsModel> addons, List<VariantsModel> variants
});




}
/// @nodoc
class _$ExtrasModelCopyWithImpl<$Res>
    implements $ExtrasModelCopyWith<$Res> {
  _$ExtrasModelCopyWithImpl(this._self, this._then);

  final ExtrasModel _self;
  final $Res Function(ExtrasModel) _then;

/// Create a copy of ExtrasModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addons = null,Object? variants = null,}) {
  return _then(_self.copyWith(
addons: null == addons ? _self.addons : addons // ignore: cast_nullable_to_non_nullable
as List<AddonsModel>,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantsModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtrasModel].
extension ExtrasModelPatterns on ExtrasModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtrasModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtrasModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtrasModel value)  $default,){
final _that = this;
switch (_that) {
case _ExtrasModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtrasModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExtrasModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AddonsModel> addons,  List<VariantsModel> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtrasModel() when $default != null:
return $default(_that.addons,_that.variants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AddonsModel> addons,  List<VariantsModel> variants)  $default,) {final _that = this;
switch (_that) {
case _ExtrasModel():
return $default(_that.addons,_that.variants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AddonsModel> addons,  List<VariantsModel> variants)?  $default,) {final _that = this;
switch (_that) {
case _ExtrasModel() when $default != null:
return $default(_that.addons,_that.variants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtrasModel implements ExtrasModel {
  const _ExtrasModel({final  List<AddonsModel> addons = const [], final  List<VariantsModel> variants = const []}): _addons = addons,_variants = variants;
  factory _ExtrasModel.fromJson(Map<String, dynamic> json) => _$ExtrasModelFromJson(json);

 final  List<AddonsModel> _addons;
@override@JsonKey() List<AddonsModel> get addons {
  if (_addons is EqualUnmodifiableListView) return _addons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addons);
}

 final  List<VariantsModel> _variants;
@override@JsonKey() List<VariantsModel> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of ExtrasModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtrasModelCopyWith<_ExtrasModel> get copyWith => __$ExtrasModelCopyWithImpl<_ExtrasModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtrasModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtrasModel&&const DeepCollectionEquality().equals(other._addons, _addons)&&const DeepCollectionEquality().equals(other._variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_addons),const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'ExtrasModel(addons: $addons, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$ExtrasModelCopyWith<$Res> implements $ExtrasModelCopyWith<$Res> {
  factory _$ExtrasModelCopyWith(_ExtrasModel value, $Res Function(_ExtrasModel) _then) = __$ExtrasModelCopyWithImpl;
@override @useResult
$Res call({
 List<AddonsModel> addons, List<VariantsModel> variants
});




}
/// @nodoc
class __$ExtrasModelCopyWithImpl<$Res>
    implements _$ExtrasModelCopyWith<$Res> {
  __$ExtrasModelCopyWithImpl(this._self, this._then);

  final _ExtrasModel _self;
  final $Res Function(_ExtrasModel) _then;

/// Create a copy of ExtrasModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addons = null,Object? variants = null,}) {
  return _then(_ExtrasModel(
addons: null == addons ? _self._addons : addons // ignore: cast_nullable_to_non_nullable
as List<AddonsModel>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantsModel>,
  ));
}


}

// dart format on
