import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(title: const Text('fl_keyboard Plugin')),
          body: const MyApp())));
}

void flKeyboardMain() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Container(
          color: Colors.white,
          alignment: Alignment.center,
          width: double.infinity,
          child: const Text('这是flKeyboardMain'))));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(20.0), child: Center(child: TextField()));
  }
}
