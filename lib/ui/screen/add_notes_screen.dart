import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/core/controller/note_add_controller.dart';

import '../../core/constants/helper_functions.dart';
import '../widgets/app_progress_indicator.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/message_view.dart';

class AddNotesScreen extends StatelessWidget {
  AddNotesScreen({Key? key}) : super(key: key);
  final _controller = Get.put(NoteAddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.2),
              CustomFormFieldText(
                title: "Title",
                requiredFieldSymbol: true,
                controller: _controller.noteTitleController,
                hint: "Type your title here",
              ),
              const SizedBox(height: 8),
              CustomFormFieldText(
                title: "Description",
                requiredFieldSymbol: true,
                controller: _controller.noteDescriptionController,
                hint: "Type your Description here",
              ),
              const SizedBox(height: 8),
              Obx(
                () => _controller.showProgress.value
                    ? const AppProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          hideKeyboard();
                          await _controller.addNotes();
                        },
                        child: const Text("Add Notes"),
                      ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  const SizedBox(height: 10),
                  _controller.obx(
                    (state) => MessageView(
                      success: true,
                      message: state ?? "",
                    ),
                    onLoading: const SizedBox(height: 0),
                    onError: (err) => MessageView(
                      success: false,
                      message: err,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
