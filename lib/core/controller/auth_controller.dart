import 'package:get/get.dart';

import '../../app_routes.dart';
import '../bindings/local_storage_binidngs.dart';
import '../constants/constants.dart';

class AuthController extends GetxController {
  var loggedIn = false.obs;

  @override
  onInit() async {
    ever(loggedIn, fireRoute);
    await userLoggedIn();
    super.onInit();
  }

  Future userLoggedIn() async {
    String savedToken =
        await LocalStorage.sharedInstance.readValue(Constants.userAuthToken);

    loggedIn.value = !savedToken.isBlank!;
  }

  void fireRoute(bool isLogged) {
    if (isLogged) {
      Get.offAllNamed(RouteNames.homeScreen);
    } else {
      Get.offAllNamed(RouteNames.loginScreen);
    }
  }

  Future logout() async {
    LocalStorage.sharedInstance.deleteValue(Constants.userAuthToken);
    loggedIn.value = false;
  }
}
