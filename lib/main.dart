import 'package:flutter/material.dart';
import 'package:startup_namer/page/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}
