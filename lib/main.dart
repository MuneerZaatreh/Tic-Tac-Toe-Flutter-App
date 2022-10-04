// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/MultiPlayer.dart';
import 'package:flutter_application_1/Solo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color.fromARGB(255, 2, 12, 44),
            shadowColor: const Color(0xFF001456),
            splashColor: const Color(0xFF4169e8)),
        home: const HomePage());
  }
}
