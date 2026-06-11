import 'dart:developer';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/features/order_history/model/order_history_model.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  final orderList = <OrderHistoryModel>[].obs;
  final UserController userController = Get.find<UserController>();
  final uid = Pref.getString('uid');

  Future<void> addOrderHistory(OrderHistoryModel orderModel) async {
    orderList.add(orderModel);
    log(
      orderList
          .map(
            (e) => {
              ...e.toJson(),
              'cartItems': e.cartItems.map((c) => c.toJson()).toList(),
            },
          )
          .toList()
          .toString(),
    );

    await saveOrderInDb(orderModel: orderModel);
  }

  Future<void> saveOrderInDb({required OrderHistoryModel orderModel}) async {
    try {
      await userController.firebaseFirestore
          .collection('user')
          .doc(uid)
          .collection('orders')
          .add(orderModel.toJson());
    } catch (e) {
      log('error -->>  $e');
    }
  }
}
