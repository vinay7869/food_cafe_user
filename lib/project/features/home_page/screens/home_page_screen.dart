import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/categories/controllers/categories_controller.dart';
import 'package:food_cafe_user/project/features/categories/widgets/dish_card.dart';
import 'package:food_cafe_user/project/features/home_page/controllers/home_controller.dart';
import 'package:food_cafe_user/project/features/home_page/widgets/feel_container.dart';
import 'package:food_cafe_user/project/features/home_page/widgets/home_menu_items.dart';
import 'package:food_cafe_user/project/features/home_page/widgets/offer_slider.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_loading.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _i = 0.obs;

  final _homeController = Get.find<HomeController>();
  final _dishController = Get.find<CategoriesController>();

  List<HomeMenuItems> homeMenuItems = [
    const HomeMenuItems(img: '$imagePath/chinese.png', cName: 'Chinese'),
    const HomeMenuItems(img: '$imagePath/indian.png', cName: 'Indian'),
    const HomeMenuItems(img: '$imagePath/italian.png', cName: 'Italian'),
    const HomeMenuItems(img: '$imagePath/french.png', cName: 'French'),
    const HomeMenuItems(img: '$imagePath/japanese.png', cName: 'Japanese'),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _homeController.getFeelData();
      await _dishController.fetchPopularDishes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: mq.width * .04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // slider widget
              _sliderWidget(_i),

              //  feel containers
              _feelContainers(_homeController),

              // banner image
              Padding(
                padding: EdgeInsets.only(
                  right: mq.width * .04,
                  top: mq.height * .03,
                  bottom: mq.height * .02,
                ),
                child: Image.asset('$imagePath/banner.png'),
              ),

              // menu items
              _menuItems(homeMenuItems),

              // today's offer
              _todaysOffer(),

              // popular today
              _popularToday(_dishController),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sliderWidget(RxInt i) {
  return Padding(
    padding: EdgeInsets.only(right: mq.width * .04),
    child: CarouselSlider(
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        onPageChanged: (index, reason) => i.value = index,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlay: true,
      ),
      items: [
        Image.asset('$imagePath/1.png'),
        Image.asset('$imagePath/1.png'),
        Image.asset('$imagePath/1.png'),
      ],
    ),
  );
}

Widget _feelContainers(HomeController homeController) {
  return Column(
    children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Text('Eat What You Feel'),
      ),
      //
      SizedBox(height: 10.h),

      //
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Wrap(
            direction: Axis.horizontal,
            children: [
              ...List.generate(
                homeController.feelList.isEmpty
                    ? 3
                    : homeController.feelList.length,
                (index) => homeController.feelList.isEmpty
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[50]!,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 14.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(17)),
                            child: ColoredBox(
                              color: Colors.black,
                              child: SizedBox(height: 140, width: 110),
                            ),
                          ),
                        ),
                      )
                    : FeelContainer(
                        onTap: homeController.feelList[index].onTap,
                        image: homeController.feelList[index].image,
                        t1: homeController.feelList[index].t1,
                        t2: homeController.feelList[index].t2,
                      ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _menuItems(List<HomeMenuItems> homeMenuItems) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Menu',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          Padding(
            padding: EdgeInsets.only(right: mq.width * .02),
            child: TextButton(
              child: const Text('See all'),
              onPressed: () {
                // Get.find<NavController>().i.value = 0;
              },
            ),
          ),
        ],
      ),

      //
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            ...List.generate(
              5,
              (index) => HomeMenuItems(
                img: homeMenuItems[index].img,
                cName: homeMenuItems[index].cName,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _todaysOffer() {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: mq.height * .02,
            top: mq.height * .03,
          ),
          child: const Text(
            'Todays Offer',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),

      //
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Wrap(
            spacing: 10,
            children: [
              OfferSlider(
                img: '$imagePath/pp_offer.png',
                price: '657',
                dishName: 'Extra Cheese Pizza',
                offerPercent: '50',
                rating: '4.8',
                onTap: () {},
              ),
              OfferSlider(
                img: '$imagePath/pp_offer.png',
                price: '657',
                dishName: 'Extra Cheese Pizza',
                offerPercent: '50',
                rating: '4.8',
                onTap: () {},
              ),
              OfferSlider(
                img: '$imagePath/pp_offer.png',
                price: '657',
                dishName: 'Extra Cheese Pizza',
                offerPercent: '50',
                rating: '4.8',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _popularToday(CategoriesController dishController) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: mq.height * .02,
            top: mq.height * .03,
          ),
          child: const Text(
            'Popular Today',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),

      Obx(
        () => Padding(
          padding: EdgeInsets.only(right: mq.width * .05),
          child: dishController.popularList.isNotEmpty
              ? Wrap(
                  spacing: mq.width * .04,
                  runSpacing: mq.height * .04,
                  children: [
                    ...List.generate(
                      dishController.popularList.length,
                      (index) => DishCard(
                        dishModel: dishController.popularList[index],
                      ),
                    ),
                  ],
                )
              : const CustomLoading(),
        ),
      ),

      //
      SizedBox(height: mq.height * .08),
    ],
  );
}
