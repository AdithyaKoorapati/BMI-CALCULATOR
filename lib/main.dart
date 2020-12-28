import 'package:flutter/material.dart';
import 'Input_Page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primaryColor: Color(0xff14193B),
        scaffoldBackgroundColor: Color(0xFF26294C)
       ),
      home: InputPage(),

    );
  }
}

