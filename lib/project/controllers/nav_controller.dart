import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/features/auth/screens/auth_landing_page.dart';
import 'package:food_cafe_user/project/features/auth/screens/login_screen.dart';
import 'package:food_cafe_user/project/features/auth/screens/sign_up_screen.dart';
import 'package:food_cafe_user/project/features/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class Nav {
  static GoRouter router = GoRouter(
    initialLocation: '/splash-screen',
    routes: <RouteBase>[
      // Splash screen
      GoRoute(
        path: '/splash-screen',
        name: '/splash-screen',
        builder: (context, state) {
          return SplashScreen();
        },
      ),

      // Auth screens
      GoRoute(
        path: '/auth-landing-page',
        name: '/auth-landing-page',
        builder: (context, state) {
          return AuthLandingPage();
        },
      ),

      GoRoute(
        path: '/login-screen',
        name: '/login-screen',
        builder: (context, state) {
          return LoginScreen();
        },
      ),

      GoRoute(
        path: '/sign-up',
        name: '/sign-up',
        builder: (context, state) {
          return SignUpScreen();
        },
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

  static void pop() => navKey.currentState!.pop();

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
