import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int counter = 0;

  increment() {
    counter++;
    notifyListeners();
  }
}
