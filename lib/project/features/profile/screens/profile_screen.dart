import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/profile/widgets/profile_options.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/logout_dialog.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool isloaded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // NavController.isDataLoaded.value
          isloaded
          ? ListView(
              padding: EdgeInsets.only(
                left: mq.width * .04,
                right: mq.width * .04,
                top: 10,
              ),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // ClipRRect(
                    //   borderRadius: const BorderRadius.all(Radius.circular(40)),
                    //   child: Obx(
                    //     () => SizedBox(
                    //       height: 70,
                    //       width: 70,
                    //       child:
                    //           //  user.value.profileUrl.isNotEmpty
                    //           //     ? CachedNetworkImage(
                    //           //         imageUrl: user.value.profileUrl,
                    //           //         placeholder: (context, url) =>
                    //           //             const CircleAvatar(
                    //           //               radius: 50,
                    //           //               child: CircularProgressIndicator(
                    //           //                 strokeWidth: 1,
                    //           //               ),
                    //           //             ),
                    //           //         errorWidget: (context, url, error) =>
                    //           //             Image.asset('$profilePath/me.png'),
                    //           //         fit: BoxFit.cover,
                    //           //       )
                    //           //     :
                    //           Image.asset('$profilePath/me.png'),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: mq.width * .04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // user.value.displayName.text,
                          'Hi',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            '+91*********',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          // user.value.email.text,
                          'e',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mq.width * .03),
                      child: InkWell(
                        // onTap: () => Nav.to(const EditProfileScreen()),
                        onTap: () {},
                        child: Image.asset('$imagePath/edit.png', scale: 4),
                      ),
                    ),
                  ],
                ),

                // bottom rows
                Padding(
                  padding: EdgeInsets.only(top: mq.height * .02),
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
