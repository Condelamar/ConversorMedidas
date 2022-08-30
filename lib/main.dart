import 'package:flutter/material.dart';
import 'package:hello_world/screens/dashboard/Conversor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 30, 6, 138),
      ),
      home: Conversor(),
    );
  }
}




