import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/helper_functions.dart';
import '../../core/controller/login_controller.dart';
import '../widgets/app_progress_indicator.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                          await _controller.login();
                        },
                        child: const Text("Login"),
                      ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("You Don't Have Account? "),
                  GestureDetector(
                    child: const Text(
                      "Create Account ",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
