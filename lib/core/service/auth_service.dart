import 'dart:convert';

import 'package:get/get.dart';
import 'package:sample_app/core/constants/constants.dart';
import 'package:sample_app/core/model/user_signin_model.dart';

import '../model/user_result.dart';
import '../model/user_signup_model.dart';

class AuthService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    super.onInit();
  }

  Future<UserResult> authenticateLoginUser(UserSignInModel model) async {
    var response =await post("/users/signin", model.toJson());
    if(!response.hasError){
      return UserResult.fromJson(json.decode(response.bodyString!));
    }else {
      return UserResult(message: "Something went wrong .try  again ");
    }
  }

  Future<UserResult> authenticateSignUpUser(UserSignUpModel model) async {
    var response =await post("/users/signup", model.toJson());
    if(!response.hasError){
      return UserResult.fromJson(json.decode(response.bodyString!));
    }else {
      return UserResult(message: "Something went wrong .try  again ");
    }
  }
}
