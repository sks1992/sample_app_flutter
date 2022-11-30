import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final String? message;
  final bool success;
  final bool showBGColor;

  const MessageView({
    required this.success,
    this.message,
    this.showBGColor = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return message == null || message!.isEmpty
        ? const SizedBox(
            height: 0,
          )
        : Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: !showBGColor
                  ? Colors.transparent
                  : success
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              message!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, color: success ? Colors.green : Colors.red),
            ),
          );
  }
}
