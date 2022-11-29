import 'package:flutter/cupertino.dart';

void hideKeyboard() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}