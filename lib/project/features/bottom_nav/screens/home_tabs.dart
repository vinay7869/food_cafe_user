import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:food_cafe_user/project/controllers/location_controller.dart';
import 'package:food_cafe_user/project/features/bottom_nav/screens/bottom_nav.dart';
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
        appBar: AppBar(
          // backgroundColor: pColor,
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
                            style: const TextStyle(
                              fontSize: 16,
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
              icon: Image.asset(
                '$imagePath/search.png',
                height: mq.height * .03,
              ),
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
        ),
        body: Obx(
          () => [
            CategoriesScreen(),
            HomePageScreen(),
            ProfileScreen(),
          ][_bottomNavController.i.value],
        ),

        //  bottom nav bar
        bottomNavigationBar: SafeArea(
          child: BottomNav(c: _bottomNavController),
        ),
      ),
    );
  }
}
