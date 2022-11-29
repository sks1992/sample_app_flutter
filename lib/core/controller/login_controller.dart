import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/core/model/user_signin_model.dart';

import '../model/user_signup_model.dart';
import '../service/auth_service.dart';
import '../service/shared_service.dart';
import 'auth_controller.dart';

class LoginController extends GetxController with StateMixin {
  final _authService = Get.find<AuthService>();
  final _sharedService = Get.find<SharedService>();
  final _authController = Get.find<AuthController>();


  var showProgress = false.obs;

  late TextEditingController _userNameController;
  late TextEditingController _passwordController;

  TextEditingController get userNameEditingController => _userNameController;

  TextEditingController get passwordEditingController => _passwordController;

  @override
  void onInit() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  Future login() async {
    final userName = userNameEditingController.text;
    final password = passwordEditingController.text;
    change(null, status: RxStatus.success());
    if (userName.isEmpty) {
      change(null, status: RxStatus.error("Please enter user name."));
      return;
    }

    if (password.isEmpty) {
      change(null, status: RxStatus.error("Please enter password."));
      return;
    }

    showProgress.value = true;
    var result = await _authService.authenticateLoginUser(
        UserSignInModel(email: userName, password: password));
    if (result.token == null) {
      change(null, status: RxStatus.error(result.message));
    } else {
      _sharedService.storeAuthToken(result);
      _authController.loggedIn.value = true;
    }
    showProgress.value = false;
  }
}
