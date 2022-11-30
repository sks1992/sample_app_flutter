import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/app_routes.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.addNotes);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => _notesController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : _notesController.errorMessage.value == ""
                    ? ListView.builder(
                        itemCount: _notesController.notesList.length,
                        itemBuilder: (context, index) {
                          var data = _notesController.notesList[index];
                          return Card(
                            elevation: 1,
                            child: Container(
                              margin: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " Title : ${data.title}",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    " Description : ${data.description}",
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    " Created At : ${data.createdAt}",
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(_notesController.errorMessage.value),
                      ),
          ),
        ),
      ),
    );
  }
}
