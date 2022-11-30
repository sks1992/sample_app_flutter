import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/core/controller/notes_controller.dart';

import '../../core/controller/auth_controller.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);
  final _authController = Get.find<AuthController>();
  final _notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notes"),
          actions: [
            IconButton(
                onPressed: () async {
                  await _authController.logout();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => _notesController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  :_notesController.errorMessage.value==""? ListView.builder(
                      itemCount: _notesController.notesList.length,
                      itemBuilder: (context, index) {
                        var data = _notesController.notesList[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              data.title,
                              style: const TextStyle(color: Colors.red),
                            ),
                            Text(data.description),
                          ],
                        );
                      },
                    ):Center(child: Text(_notesController.errorMessage.value),)
            ),
          ),
        ));
  }
}
