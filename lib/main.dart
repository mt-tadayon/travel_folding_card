import 'package:flutter/material.dart';
import 'package:flutterchallenge02/animated_screen.dart';
import 'package:flutterchallenge02/inside_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE2D5),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            InsideScreen(),
            AnimatedScreen()
          ],
        ),
      ),
    );
  }
}


