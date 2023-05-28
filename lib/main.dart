import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness:Brightness.dark,
        primarySwatch: Colors.blue,
        shadowColor: Color(0xFF001456),
        primaryColor: Colors.black,
        splashColor: Colors.blueAccent

      ),
      home: const HomePage(),
    );
  }
}

