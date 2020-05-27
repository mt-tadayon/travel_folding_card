import 'package:flutter/material.dart';

import 'animated_screen.dart';
import 'inside_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(100, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE2D5),
      body: Center(
        child: InkWell(
          onTap: () {},
          onHover: (value) {
            if (value) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          child: Transform.translate(
            offset: _animation.value,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                InsideScreen(),
                AnimatedScreen(controller: _controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
