import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/profile/controllers/profile_controller.dart';
import 'package:food_cafe_user/project/features/profile/screens/admin_controls/admin_upload_screen.dart';
import 'package:food_cafe_user/project/features/profile/widgets/profile_options.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/logout_dialog.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    _profileController.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          left: mq.width * .04,
          right: mq.width * .04,
          top: 10,
        ),
        children: [
          Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: blackColor),
                    borderRadius: BorderRadius.all(Radius.circular(70.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(70.r)),
                      child: SizedBox(
                        height: 80.w,
                        width: 80.w,
                        child:
                            _profileController.user.value.profilePic.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl:
                                    _profileController.user.value.profilePic,
                                placeholder: (context, url) => CircleAvatar(
                                  radius: 50.r,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset('$profilePath/me.png'),
                                fit: BoxFit.cover,
                              )
                            : Image.asset('$profilePath/me.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: mq.width * .04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _profileController.user.value.name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        '+91*********',
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ),
                    Text(
                      _profileController.user.value.email,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: mq.width * .03),
                  child: InkWell(
                    onTap: () => context.goNamed('editProfile'),
                    child: Image.asset('$imagePath/edit.png', scale: 4),
                  ),
                ),
              ],
            ),
          ),

          // bottom rows
          Padding(
            padding: EdgeInsets.only(top: mq.height * .01),
            child: const Divider(thickness: 0.5),
          ),
          ProfileOptions(
            image: '$profilePath/wallet.png',
            text: 'My Orders',
            // onTap: () => Nav.to(const MyOrders()),
            onTap: () {},
          ),
          ProfileOptions(
            image: '$profilePath/location.png',
            text: 'Address',
            // onTap: () => Nav.to(const AddressScreen()),
            onTap: () {},
          ),
          ProfileOptions(
            image: '$profilePath/notification.png',
            text: 'Notification',
            onTap: () {},
          ),
          ProfileOptions(
            image: '$profilePath/heart.png',
            text: 'Favorites',
            // onTap: () => Get.to(() => const MyWishList()),
            onTap: () {},
          ),
          ProfileOptions(
            image: '$profilePath/lock.png',
            text: 'Privacy Policy',
            onTap: () {},
          ),
          ProfileOptions(
            image: '$profilePath/faq.png',
            text: 'FAQ',
            onTap: () {},
          ),
          ProfileOptions(
            image: '$profilePath/help.png',
            text: 'Help Center',
            onTap: () {},
          ),
          Visibility(
            // visible: _profileController.user.value.isAdmin,
            child: ProfileOptions(
              image: '$profilePath/lock.png',
              text: 'Admin upload',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AdminPanelScreen()),
                );
              },
            ),
          ),
          ProfileOptions(
            image: '$profilePath/logout.png',
            text: 'Logout',
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return LogoutDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
