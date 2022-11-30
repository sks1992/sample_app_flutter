import 'package:get/get.dart';
import 'package:sample_app/core/service/shared_service.dart';

import '../constants/constants.dart';

class BaseAppApi extends GetConnect {
  final SharedService _sharedService = Get.find<SharedService>();

  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = const Duration(minutes: 1);
    httpClient.maxAuthRetries = 2;

    httpClient.addAuthenticator<void>((request) async {
      var authToken = await _sharedService.getAccessToken();
      request.headers['Authorization'] = '${Constants.tokenType} $authToken';
      return request;
    });

    super.onInit();
  }
}
