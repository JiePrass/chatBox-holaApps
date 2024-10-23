import 'package:flutter/material.dart';
import 'app/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbox App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
