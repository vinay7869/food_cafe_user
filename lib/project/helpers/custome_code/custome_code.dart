import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomeCode {
  static Future<void> launchURL() async {
    final uri = Uri.parse(
      'https://play.google.com/store/apps/details?id=$packageName',
    );

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  static void sacffoldErrorDialog(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMsg)));
  }
}

class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json is Timestamp) return json.toDate();
    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;
    return Timestamp.fromDate(object);
  }
}
