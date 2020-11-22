import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
//Initial private state of the value
  int _counter = 0;

  //Getter
  int get value => _counter;

  //Method
  void increment() {
    _counter++;
    notifyListeners();
  }

  //Method
  void reset() {
    _counter = 0;
    notifyListeners();
  }
}
