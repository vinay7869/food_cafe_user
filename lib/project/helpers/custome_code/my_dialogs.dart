import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'global.dart';

class MyDialogs {
  static void showToast(String msg, Toast toastLength) {
    Fluttertoast.showToast(msg: msg, toastLength: toastLength);
  }

  static void error({required String msg}) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red),
    );
  }

  static void success({required String msg}) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.green),
    );
  }

  static void info({required String msg}) {
    messengerKey.currentState?.showSnackBar(SnackBar(content: Text(msg)));
  }
}
