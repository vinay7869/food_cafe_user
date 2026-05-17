import 'package:food_cafe_user/project/features/profile/screens/address/address_controller.dart/address_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    @Default('') String id,
    @Default('') String addressLine1,
    @Default('') String street,
    @Default('') String city,
    @Default('') String pincode,
    @Default('') String state,
    @Default('') String country,
    @Default(AddressType.home) AddressType addressType,

  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
