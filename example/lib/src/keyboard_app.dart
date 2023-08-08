import 'package:flutter/material.dart';
import 'package:flutter_waya/flutter_waya.dart';

class KeyboardApp extends StatelessWidget {
  const KeyboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: const Scaffold(backgroundColor: Colors.grey, body: HomeApp()));
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
      const SizedBox(
          width: double.infinity,
          height: 100,
          child: FlAnimationWave(
              value: 0.5,
              color: Colors.deepPurpleAccent,
              direction: Axis.vertical)),
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
