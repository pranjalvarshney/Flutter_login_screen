import 'package:flutter/material.dart';
import 'package:login_screen/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.light(),
      title: "Login Screen",
    );
  }
}