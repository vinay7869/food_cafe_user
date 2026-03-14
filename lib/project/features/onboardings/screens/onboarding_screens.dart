import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/controllers/nav_controller.dart';
import 'package:food_cafe_user/project/features/auth/screens/auth_landing_page.dart';
import 'package:food_cafe_user/project/features/bottom_nav/screens/bottom_nav.dart';
import 'package:food_cafe_user/project/features/onboardings/model/onboarding_model.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_button.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final List<OnboardingModel> onboardingModel = [
    OnboardingModel(
      title: "Variety's of menu",
      description: "Foodie Adventures Await. Endless Options, Delivered Fresh.",
      imagePath: '$imagePath/on1.png',
    ),
    OnboardingModel(
      title: 'Fast Delivery',
      description:
          "Skip The Wait, Not The Flavor. Fast Delivery, Guaranteed Delicious.",
      imagePath: '$imagePath/on2.png',
    ),
    OnboardingModel(
      title: 'Tasty Food',
      description:
          "Hungry? We Got Your Cravings Covered. Flavour Explosions, Delivered Hot.",
      imagePath: '$imagePath/on3.png',
    ),
  ];

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('$imagePath/onb_bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingModel.length,
                itemBuilder: (context, index) {
                  return
                  //
                  Column(
                    children: [
                      SizedBox(
                        height: index == 2 ? mq.height * .18 : mq.height * .14,
                      ),
                      Image.asset(onboardingModel[index].imagePath),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.only(top: mq.height * .08),
                          child: Text(
                            onboardingModel[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: pColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: mq.height * .01),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: mq.width * .07,
                            left: mq.width * .07,
                            bottom: mq.width * .17,
                            top: mq.width * .01,
                          ),
                          child: Text(
                            onboardingModel[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6C6C6C),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 8,
                            width: index == 0 ? 20 : 10,
                            decoration: BoxDecoration(
                              color: index == 0 ? pColor : Colors.grey[400],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Container(
                            height: 8,
                            width: index == 1 ? 20 : 10,
                            decoration: BoxDecoration(
                              color: index == 1 ? pColor : Colors.grey[400],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Container(
                            height: 8,
                            width: index == 2 ? 20 : 10,
                            decoration: BoxDecoration(
                              color: index == 2 ? pColor : Colors.grey[400],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: mq.height * .03,
                          right: mq.width * .05,
                          left: mq.width * .05,
                        ),
                        child: CustomButton(
                          text: 'Next',
                          color: pColor,
                          onTap: () {
                            if (index < onboardingModel.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            } else {
                              Nav.pushNamed(AuthLandingPage.routeName);
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
