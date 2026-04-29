import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:food_cafe_user/project/controllers/location_controller.dart';
import 'package:food_cafe_user/project/features/bottom_nav/screens/bottom_nav.dart';
import 'package:food_cafe_user/project/features/bottom_nav/widgets/bottom_order_card.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/categories/screens/categories_screen.dart';
import 'package:food_cafe_user/project/features/home_page/screens/home_page_screen.dart';
import 'package:food_cafe_user/project/features/profile/screens/profile_screen.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/exit_dialog.dart';
import 'package:get/get.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final _bottomNavController = Get.find<BottomNavController>();
  final _cartController = Get.find<CartController>();

  final showBottomsheet = false.obs;

  @override
  void initState() {
    LocationController.getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        showDialog(
          context: context,
          builder: (context) {
            return ExitDialog();
          },
        );
      },
      child: Scaffold(
        // app bar
        appBar: _appBarContent(),

        // body
        body: Obx(
          () => [
            CategoriesScreen(),
            HomePageScreen(),
            ProfileScreen(),
          ][_bottomNavController.i.value],
        ),

        // bottom sheet
        bottomSheet: _bottomSheetWidget(_cartController, showBottomsheet),

        //  bottom nav bar
        bottomNavigationBar: SafeArea(
          child: BottomNav(c: _bottomNavController),
        ),
      ),
    );
  }
}

PreferredSizeWidget _appBarContent() {
  return AppBar(
    title: Row(
      children: [
        Image.asset('$profilePath/location.png', scale: 4),
        SizedBox(width: 10.w),
        Obx(
          () => LocationController.isAreaLoaded.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocationController.stnName.value,
                      style:  TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${LocationController.streetName.value},${LocationController.pinCode.value}",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                )
              : Text(
                  'Fetching your location...',
                  style: TextStyle(fontSize: 13.sp),
                ),
        ),
      ],
    ),
    centerTitle: false,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        // onPressed: () => Get.to(() => const SearchScreen()),
        onPressed: () {},
        icon: Image.asset('$imagePath/search.png', height: mq.height * .03),
      ),
      IconButton(
        // onPressed: () => Get.to(() => const NotificationScreen()),
        onPressed: () {},
        icon: Image.asset(
          '$imagePath/notification.png',
          height: mq.height * .03,
        ),
      ),
    ],
  );
}

Widget _bottomSheetWidget(
  CartController cartController,
  RxBool showBottomsheet,
) {
  return Obx(
    () => cartController.cartList.isNotEmpty
        ? showBottomsheet.value
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    right: mq.width * .04,
                    left: mq.width * .04,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Your Cart (${cartController.cartList.length})',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showBottomsheet.value = false,
                              icon: const Icon(CupertinoIcons.xmark_circle),
                            ),
                          ],
                        ),
                        ...cartController.cartList.mapIndexed(
                          (i, e) => SizedBox(
                            height: mq.height * .08,
                            child:
                                BottomOrderCard(
                                  cartItemModel: e,
                                  i: i,
                                  cartController: cartController,
                                ).animate().slideY(
                                  begin: 1,
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.ease,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    ...cartController.cartList.mapIndexed(
                      (i, e) => cartController.cartList.length > 1
                          ? Container(
                              height: mq.height * .1,
                              margin: EdgeInsets.symmetric(
                                horizontal: mq.width * .04,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: cartController.cartList.length == (i + 1)
                                      ? 15
                                      : 6,
                                ),
                                child:
                                    BottomOrderCard(
                                      cartItemModel: e,
                                      i: i,
                                      cartController: cartController,
                                    ).animate().slideY(
                                      duration: const Duration(
                                        milliseconds: 700,
                                      ),
                                      curve: Curves.ease,
                                    ),
                              ),
                            )
                          : Container(
                              height: mq.height * .08,
                              margin: EdgeInsets.symmetric(
                                horizontal: mq.width * .04,
                              ),
                              child:
                                  BottomOrderCard(
                                    cartItemModel: e,
                                    i: i,
                                    cartController: cartController,
                                  ).animate().slideY(
                                    duration: const Duration(milliseconds: 700),
                                    curve: Curves.ease,
                                  ),
                            ),
                    ),
                    cartController.cartList.length > 1
                        ? InkWell(
                            onTap: () => showBottomsheet.value = true,
                            child: Container(
                              margin: EdgeInsets.only(bottom: mq.height * .08),
                              decoration: const BoxDecoration(
                                color: pColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                '+${cartController.cartList.length - 1} More',
                                style: const TextStyle(
                                  color: txtColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                )
        : const SizedBox(),
  );
}
