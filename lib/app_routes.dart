import 'package:get/get.dart';
import 'package:sample_app/ui/screen/dash_board_screen.dart';
import 'package:sample_app/ui/screen/notes_screen.dart';
import 'package:sample_app/ui/screen/login_screen.dart';
import 'package:sample_app/ui/screen/signup_screen.dart';
import 'package:sample_app/ui/screen/splash_screen.dart';

class RouteNames {
  static String loginScreen = "/login";
  static String signupScreen = "/signup";
  static String notesScreen = "/notes";
  static String splashScreen = "/splash";
  static String dashboard = "/dashboard";

}

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
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
      name: RouteNames.notesScreen,
      page: () => NotesScreen(),
    ),
    GetPage(
      name: RouteNames.dashboard,
      page: () => const DashBoardScreen(),
    ),
  ];
}
