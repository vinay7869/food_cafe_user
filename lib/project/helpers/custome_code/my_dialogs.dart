import 'package:flutter/material.dart';
import 'global.dart';

class MyDialogs {
  static void error({required String msg}) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red,),
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
