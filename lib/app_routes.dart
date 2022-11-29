import 'package:get/get.dart';
import 'package:sample_app/ui/screen/home_screen.dart';
import 'package:sample_app/ui/screen/login_screen.dart';
import 'package:sample_app/ui/screen/signup_screen.dart';
import 'package:sample_app/ui/screen/splash_screen.dart';

class RouteNames {
  static String loginScreen = "/login";
  static String signupScreen = "/signup";
  static String homeScreen = "/home";
  static String splashScreen = "/splash";
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteNames.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteNames.signupScreen,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: RouteNames.homeScreen,
      page: () => HomeScreen(),
    ),
  ];
}
