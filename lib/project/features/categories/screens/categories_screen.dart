import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_cafe_user/project/features/categories/controllers/categories_controller.dart';
import 'package:food_cafe_user/project/features/categories/widgets/category_card.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _categoriesController = Get.find<CategoriesController>();

  @override
  void initState() {
    _categoriesController.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => !_categoriesController.isLoading.value
            ? ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: mq.width * .04,
                  right: mq.width * .04,
                  bottom: mq.width * .04,
                  top: mq.height * .02,
                ),
                children: [
                  Wrap(
                    spacing: mq.width * .04,
                    runSpacing: 17,
                    children: _categoriesController.categories.map((e) {
                      final img = e['image'];
                      final name = e['name'];
                      return CategoryCard(img: img, dishName: name);
                    }).toList(),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
