
import 'package:flutter/material.dart';
import 'TarBar/ZHTabIndexPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.red,
      ),
      home: ZHTabIndexPage(),
      debugShowCheckedModeBanner: false,
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
