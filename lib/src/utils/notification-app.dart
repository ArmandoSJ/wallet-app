import 'package:flutter/material.dart';

class NotificationsApp {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      backgroundColor: color,
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}