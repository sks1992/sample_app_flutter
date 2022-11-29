import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../service/auth_service.dart';
import '../service/shared_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SharedService>(SharedService());
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AuthService>(AuthService(), permanent: true);
  }
}