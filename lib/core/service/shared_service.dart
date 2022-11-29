import '../bindings/local_storage_binidngs.dart';
import '../constants/constants.dart';
import '../model/user_result.dart';

class SharedService {
  void storeAuthToken(UserResult authToken) {
    LocalStorage.sharedInstance.writeValue(
      key: Constants.userAuthToken,
      value: authToken.token,
    );
    //clear tokens to reduce size
   // authToken.token = "";
  }

  Future<String> getAccessToken() async {
    return await LocalStorage.sharedInstance.readValue(Constants.userAuthToken);
  }
}
