import 'dart:convert';

import 'package:sample_app/core/model/note_model.dart';
import 'package:sample_app/core/model/note_model_result.dart';
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
  Future<NoteModelResult> postNoteData(NoteModel model) async {
    var response =await post("/note", model.toJson());
    if(!response.hasError){
      return NoteModelResult.fromJson(json.decode(response.bodyString!));
    }else {
      return NoteModelResult();
    }
  }
}
