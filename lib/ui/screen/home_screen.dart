import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final _authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [IconButton(onPressed: ()async {
          await _authController.logout();
        }, icon:  const Icon(Icons.logout))],
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
