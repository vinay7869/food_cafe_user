import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/features/auth/screens/auth_landing_page.dart';
import 'package:food_cafe_user/project/features/auth/screens/login_screen.dart';
import 'package:food_cafe_user/project/features/auth/screens/sign_up_screen.dart';
import 'package:food_cafe_user/project/features/bottom_nav/screens/home_tabs.dart';
import 'package:food_cafe_user/project/features/categories/model/cart_item_model.dart';
import 'package:food_cafe_user/project/features/categories/screens/dish_info.dart';
import 'package:food_cafe_user/project/features/categories/screens/dish_list_screen.dart';
import 'package:food_cafe_user/project/features/checkout/screens/checkout_screen.dart';
import 'package:food_cafe_user/project/features/onboardings/screens/onboarding_screens.dart';
import 'package:food_cafe_user/project/features/profile/screens/edit_profile_screen.dart';
import 'package:food_cafe_user/project/features/splash_screen/splash_screen.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';
import 'package:go_router/go_router.dart';

class Nav {
  static GoRouter router = GoRouter(
    initialLocation: '/splash-screen',
    routes: <RouteBase>[
      // Splash screen
      GoRoute(
        path: '/splash-screen',
        name: 'splash-screen',
        builder: (context, state) {
          return SplashScreen();
        },
      ),

      // Onboardings
      GoRoute(
        path: '/onbordings',
        name: 'onbordings',
        builder: (context, state) {
          return OnboardingScreens();
        },
      ),

      // Auth screens
      GoRoute(
        path: '/auth-landing-page',
        name: 'auth-landing-page',
        builder: (context, state) {
          return AuthLandingPage();
        },
        routes: [
          GoRoute(
            path: 'login-screen',
            name: 'login-screen',
            builder: (context, state) {
              return LoginScreen();
            },
          ),

          GoRoute(
            path: 'sign-up',
            name: 'sign-up',
            builder: (context, state) {
              return SignUpScreen();
            },
          ),
        ],
      ),

      // Bottom Nav
      GoRoute(
        path: '/homeTabs',
        name: 'homeTabs',
        builder: (context, state) {
          return HomeTabs();
        },

        routes: [
          // Profile flow starts here
          GoRoute(
            path: 'editProfile',
            name: 'editProfile',
            builder: (context, state) {
              return EditProfileScreen();
            },
          ),

          // Dish flow starts here
          GoRoute(
            path: 'dishList',
            name: 'dishList',
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;

              final categoryId = data['id'];
              final dishName = data['name'];
              return DishList(categoryId: categoryId, dishName: dishName);
            },
          ),

          GoRoute(
            path: 'dishInfo',
            name: 'dishInfo',
            builder: (context, state) {
              final dishModel = state.extra as DishModel;
              return DishInfoScreen(dishModel: dishModel);
            },
          ),

          GoRoute(
            path: 'checkout',
            name: 'checkout',
            builder: (context, state) {
              // final cartItemModel = state.extra as CartItemModel;
              return CheckoutScreen();
            },
          ),
        ],
      ),
    ],
  );

  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Future<dynamic> push(Widget page) {
    return navKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return navKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static void pop() => navKey.currentState?.pop();

  static Future<dynamic> pushAndRemoveUntil(Widget page) {
    return navKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Auth screens
    case '/auth-landing-page':
      return MaterialPageRoute(builder: (_) => AuthLandingPage());

    case '/login-screen':
      return MaterialPageRoute(builder: (_) => LoginScreen());

    case '/sign-up':
      return MaterialPageRoute(builder: (_) => const SignUpScreen());

    // default screen
    default:
      return MaterialPageRoute(
        builder: (_) => const CircularProgressIndicator(),
      );
  }
}
