import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/firebase_options.dart';
import 'package:food_cafe_user/project/controllers/nav_controller.dart';
import 'package:food_cafe_user/project/features/auth/auth_controller/google_auth.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';
import 'project/helpers/custome_code/pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //
  await GoogleSignInAuth().googleSignIn.initialize();

  // initialize shared preferences
  await Pref.init();

  // lock orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Food cafe user',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: scaffoldBgClr,
            fontFamily: 'Poppins',
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              centerTitle: false,
            ),
          ),
          scaffoldMessengerKey: messengerKey,
          routerDelegate: Nav.router.routerDelegate,
          routeInformationParser: Nav.router.routeInformationParser,
          routeInformationProvider: Nav.router.routeInformationProvider,
        );
      },
    );
  }
}
