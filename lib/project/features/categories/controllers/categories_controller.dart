import 'dart:developer';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final userController = Get.find<UserController>();
  RxList<dynamic> categories = [].obs;
  RxBool isLoading = false.obs;
  RxList<DishModel> dishList = <DishModel>[].obs;

  Future<void> fetchCategories() async {
    try {
      RxBool isLoading = true.obs;
      final snapshot = await userController.firebaseFirestore
          .collection('categories')
          .get();

      categories.value = snapshot.docs.map((e) => e.data()).toList();
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDishList(String doc) async {
    try {
      isLoading.value = true;
      final snapshot = await userController.firebaseFirestore
          .collection('categories')
          .doc(doc)
          .collection('dishes')
          .get();

      dishList.value = snapshot.docs
          .map((e) => DishModel.fromJson(e.data()))
          .toList();
      isLoading.value = false;
    } catch (e) {
      e.toString();
      isLoading.value = false;
    }
  }
}
