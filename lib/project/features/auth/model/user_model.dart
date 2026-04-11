import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_cafe_user/project/features/auth/model/address_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? uid,
    @Default('') String name,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String profilePic,
    @Default([]) List<Address> address,
    @DateTimeConverter() DateTime? dob,
    @Default(false) bool isAdmin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime?, Object?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;

    if (json is Timestamp) return json.toDate();

    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;

    return Timestamp.fromDate(object);
  }
}
