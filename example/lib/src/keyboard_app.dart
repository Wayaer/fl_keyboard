import 'package:flutter/material.dart';

class KeyboardApp extends StatelessWidget {
  const KeyboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: const Scaffold(
            backgroundColor: Colors.grey,
            body: Padding(padding: EdgeInsets.all(20.0), child: HomeApp())));
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(width: double.infinity),
      const Text('这里是 flKeyboardMain'),
      ElevatedButton(
          onPressed: () {
            print('ElevatedButton====');
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('SnackBar')));
          },
          child: const Text('showSnackBar'))
    ]);
  }
}
