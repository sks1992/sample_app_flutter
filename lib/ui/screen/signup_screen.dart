import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/app_routes.dart';

import '../../core/constants/helper_functions.dart';
import '../../core/controller/signup_controller.dart';
import '../widgets/app_progress_indicator.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/message_view.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              const CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
              SizedBox(height: Get.height * 0.05),
              CustomFormFieldText(
                title: "UserName",
                requiredFieldSymbol: true,
                controller: _controller.userNameEditingController,
                hint: "Type your user name here",
              ),
              const SizedBox(height: 8),
              CustomFormFieldText(
                title: "Email",
                requiredFieldSymbol: true,
                controller: _controller.userEmailEditingController,
                hint: "Type your email here",
              ),
              const SizedBox(height: 8),
              CustomFormFieldText(
                title: "Password",
                requiredFieldSymbol: true,
                controller: _controller.passwordEditingController,
                obscureText: true,
                hint: "Type your password here",
              ),
              const SizedBox(height: 8),
              Obx(
                () => _controller.showProgress.value
                    ? const AppProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          hideKeyboard();
                          await _controller.signup();
                        },
                        child: const Text("Signup"),
                      ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("You already Have Account? "),
                  GestureDetector(
                    child: const Text(
                      "Go to Login ",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      Get.offAllNamed(RouteNames.loginScreen);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  _controller.obx(
                    (state) => MessageView(
                      success: true,
                      message: state ?? "",
                    ),
                    onLoading: const SizedBox(height: 0),
                    onError: (err) => MessageView(
                      success: false,
                      message: err,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
