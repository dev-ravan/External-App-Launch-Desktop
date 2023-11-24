import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'External App Launch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 127, 245, 254)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "EXTERNAL APP LAUNCH",
          style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchApp,
          child: const Text("Launch"),
        ),
      ),
    );
  }

  _launchApp() async {
    try {
      String externalAppPath =
          "C:\\Users\\D E L L\\AppData\\Local\\MongoDBCompass\\MongoDBCompass.exe";

      await Process.start(externalAppPath, []);
    } catch (e) {
      print("Launch Failed 😣 $e");
      return false;
    }
  }
}
