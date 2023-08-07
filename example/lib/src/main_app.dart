import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: Scaffold(
            appBar: AppBar(title: const Text('fl_keyboard Plugin')),
            body: const HomeApp()));
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(focusNode: focusNode),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                focusNode.unfocus();
              },
              child: const Text('移除TextField焦点'))
        ]));
  }
}
