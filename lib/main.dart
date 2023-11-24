// ignore_for_file: use_build_context_synchronously

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
          "C:\\Program Files (x86)\\Atre Software\\atre_windows.exe";

      await Process.start(externalAppPath, []);
    } catch (e) {
      print("Launch Failed 😣 $e");
      return false;
    }
  }

  // Future<void> checkAndLaunchExternalApp() async {
  //   // Replace 'external_app.exe' with the actual executable file name of the external app
  //   String externalAppName = 'atre_windows.exe';

  //   // Try to find the path of the installed app
  //   String? appPath = await findApplicationPath(externalAppName);

  //   if (appPath != null) {
  //     // If found, launch the external app
  //     Process.start(appPath, []);
  //   } else {
  //     // If not found, show a dialog prompting the user to install the app
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('App Not Found'),
  //           content: const Text(
  //               'The application is installed, but its path could not be determined.'),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  // Future<String?> findApplicationPath(String appName) async {
  //   // Common installation directories on Windows
  //   List<String> commonDirectories = [
  //     r'C:\\Program Files',
  //     r'C:\\Program Files (x86)',
  //   ];

  //   for (String directory in commonDirectories) {
  //     String fullPath = '$directory\\$appName';

  //     if (await File(fullPath).exists()) {
  //       return fullPath;
  //     }
  //   }

  //   return null;
  // }
}
