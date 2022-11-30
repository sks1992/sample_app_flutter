import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/app_routes.dart';
import 'package:sample_app/core/model/note_model.dart';

import '../service/app_api_service.dart';

class NoteAddController extends GetxController with StateMixin {
  final _appApi = Get.find<AppApi>();

  var showProgress = false.obs;

  late TextEditingController _noteTitleController;
  late TextEditingController _noteDescriptionController;

  TextEditingController get noteTitleController => _noteTitleController;

  TextEditingController get noteDescriptionController =>
      _noteDescriptionController;

  @override
  void onInit() {
    _noteTitleController = TextEditingController();
    _noteDescriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _noteTitleController.dispose();
    _noteDescriptionController.dispose();
    super.onClose();
  }

  Future addNotes() async {
    final title = noteTitleController.text;
    final description = noteDescriptionController.text;
    change(null, status: RxStatus.success());

    if (title.isEmpty) {
      change(null, status: RxStatus.error("Please fill the title."));
      return;
    }

    if (description.isEmpty) {
      change(null, status: RxStatus.error("Please enter Description."));
      return;
    }

    showProgress.value = true;
    var result = await _appApi
        .postNoteData(NoteModel(title: title, description: description));
    if (result.title == null) {
      showProgress.value = false;
      change(null,
          status: RxStatus.error("Something went wrong on Post request"));
    } else {
      // Get.snackbar("Success", "Post Is Success",
      //     snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(RouteNames.notesScreen);
      showProgress.value = false;
    }
    showProgress.value = false;
  }
}
