import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMC",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: HomePage(),
    );
  }
}
