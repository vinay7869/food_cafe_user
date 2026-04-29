import 'dart:developer';
import 'dart:io';
import 'package:food_cafe_user/project/controllers/user_controller.dart';
import 'package:food_cafe_user/project/features/categories/model/category_model.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CategoriesController extends GetxController {
  final userController = Get.find<UserController>();
  RxList<Category> categories = <Category>[].obs;
  RxBool isLoading = false.obs;
  RxBool isDishLoading = false.obs;
  RxList<DishModel> dishList = <DishModel>[].obs;
  RxList<DishModel> popularList = <DishModel>[].obs;

  Future<void> fetchCategories() async {
    try {
      isLoading = true.obs;
      final snapshot = await userController.firebaseFirestore
          .collection('categories')
          .get();

      categories.value = snapshot.docs
          .map((e) => Category.fromFirestore(e))
          .toList();
    } catch (e) {
      log('ERROR: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDishList(String doc) async {
    try {
      isDishLoading.value = true;
      final snapshot = await userController.firebaseFirestore
          .collection('categories')
          .doc(doc)
          .collection('dishes')
          .get();

      dishList.value = snapshot.docs.map((e) {
        final data = e.data();

        return DishModel.fromJson({...data, 'id': e.id});
      }).toList();
    } catch (e) {
      log('ERROR: $e');
    } finally {
      isDishLoading.value = false;
    }
  }

  Future<void> fetchPopularDishes() async {
    try {
      final snapshot = await userController.firebaseFirestore
          .collectionGroup('dishes')
          .where('isPopularToday', isEqualTo: true)
          .get();

      popularList.value = snapshot.docs.map((e) {
        final data = e.data();
        return DishModel.fromJson({...data, 'id': e.id});
      }).toList();

      
    } catch (e) {
      log('ERROR fetchPopularDishes : $e');
    } finally {}
  }

  Future<File> downloadFile(String url, String fileName) async {
    final response = await http.get(Uri.parse(url));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File(path.join(documentDirectory.path, fileName));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
