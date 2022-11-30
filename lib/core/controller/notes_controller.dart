import 'package:get/get.dart';
import 'package:sample_app/core/model/user_notes_model.dart';

import '../service/app_api_service.dart';


class NotesController extends GetxController {
  final _appApi = Get.find<AppApi>();

  @override
  void onInit() {
    getNotesData();
    super.onInit();
  }


  var notesList = RxList<UserNotesModel>([]);
  var errorMessage = "".obs;
  var isLoading = false.obs;

  Future<void> getNotesData() async {
    isLoading.value = true;
    var result = await _appApi.getNotes();

    if (result.isEmpty) {
      isLoading.value = false;
      errorMessage.value = "Something Went Wrong";
    } else {
      isLoading.value = false;
      notesList.value = result;
    }
  }
}
