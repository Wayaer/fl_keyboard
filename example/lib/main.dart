import 'package:example/src/keyboard_app.dart';
import 'package:example/src/main_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

@pragma('vm:entry-point')
void flKeyboardMain() {
  runApp(const KeyboardApp());
}
