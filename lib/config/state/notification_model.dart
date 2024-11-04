import 'package:flutter/material.dart';

class NotificationModel extends ChangeNotifier {
  bool hasNotification = true;

  open() {
    hasNotification = false;
    notifyListeners();
  }
}
