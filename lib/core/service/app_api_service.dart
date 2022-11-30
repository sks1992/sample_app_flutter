import 'dart:convert';

import 'package:sample_app/core/model/user_notes_model.dart';

import 'base_app_api.dart';

class AppApi extends BaseAppApi {
  Future<List<UserNotesModel>> getNotes() async {
    var response = await get("/note");
    if (response.hasError) {
      return [];
    } else {
      return List<UserNotesModel>.from(
        json.decode(response.bodyString!).map(
              (e) => UserNotesModel.fromJson(e),
            ),
      );
    }
  }
}
