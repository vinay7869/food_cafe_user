import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/features/order_history/model/order_history_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  final orderHistory = <OrderHistoryModel>[].obs;
  final isLoading = false.obs;
  final UserController userController = Get.find<UserController>();
  // final uid = Pref.getString('uid');

  String get uid => Pref.getString('uid') ?? '';

  Future<void> saveOrderInDb({required OrderHistoryModel orderModel}) async {
    try {
      try {
        log("Started");

        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .collection('orders')
            .doc()
            .set(orderModel.toJson())
            .timeout(const Duration(seconds: 15));

        log("Ended");
      } catch (e, s) {
        log("ERROR: $e");
        log(s.toString());
      }
    } catch (e) {
      log('error -->>  $e');
    }
  }

  Future<void> getOrderHistory() async {
    log('called order history');
    try {
      isLoading.value = true;

  

      FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('orders')
          .orderBy('createdAt', descending: true)
          .snapshots()
          .listen((snapshot) {
            orderHistory.assignAll(
              snapshot.docs.map((e) => OrderHistoryModel.fromJson(e.data())),
            );

            log(
              'orderlist -->>  ${orderHistory.map((element) => element.toJson())}',
            );
          });


      log('now here final');

      isLoading.value = false;
    } catch (e) {
      log('error -->>  $e');
      isLoading.value = false;
    }
  }
}
