import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/features/categories/controllers/categories_controller.dart';
import 'package:food_cafe_user/project/features/categories/screens/dish_info_screen.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DishList extends StatefulWidget {
  final String cuisineName;
  const DishList({super.key, required this.cuisineName});

  @override
  State<DishList> createState() => _DishListState();
}

class _DishListState extends State<DishList> {
  final _i = 0.obs;
  final dishController = Get.find<CategoriesController>();

  @override
  initState() {
    dishController.fetchCategories();
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.cuisineName} Cuisine",
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: ['All', 'Veg', 'Nonveg']
                    .mapIndexed(
                      (i, e) => InkWell(
                        onTap: () => _i.value = i,
                        radius: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: _i.value == i
                                ? Colors.blue.withValues(alpha: .20)
                                : Colors.transparent,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(17),
                            ),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              Image.asset('$imagePath/$e.png', scale: 3.7),
                              const SizedBox(width: 7),
                              Text(e),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: mq.height * .03),
            dishController.dishList.isNotEmpty
                ? ListView(
                    padding: EdgeInsets.only(
                      left: mq.width * .05,
                      right: mq.width * .05,
                    ),
                    shrinkWrap: true,
                    children: [
                      IndexedStack(
                        index: _i.value,
                        children: [
                          // All Food
                          _wrap(dishController.dishList.toList()),

                          // Veg
                          _wrap(
                            dishController.dishList
                                .where((food) => food.isVeg)
                                .toList(),
                          ),

                          // Non-Veg
                          _wrap(
                            dishController.dishList
                                .where((food) => !food.isVeg)
                                .toList(),
                          ),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: mq.height * .3),
                      child: const Text('No Data found'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _wrap(List list) => Wrap(
    alignment: WrapAlignment.start,
    spacing: mq.width * .04,
    runSpacing: mq.width * .03,

    //
    children: [
      ...list.mapIndexed(
        (i, e) =>
            // DishCard(foodModel: e)
            DishInfoScreen(),
      ),
    ],
  );
}
