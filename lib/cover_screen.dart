import 'dart:math';

import 'package:flutter/material.dart';

class CoverScreen extends StatefulWidget {
  @override
  _CoverScreenState createState() => _CoverScreenState();
}

class _CoverScreenState extends State<CoverScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        if(value) {
          _controller.forward();
          setState(() {
          });
        } else {
          _controller.reverse();
          setState(() {

          });
        }
      },
      child: Transform(
        transform: Matrix4.rotationY(pi * _animation.value),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(color: Color(0xffff62b2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.build,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  Text(
                    'City break',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'From €29',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: 200,
              color: Colors.white,
              child: Center(
                child: Text(
                  'View me',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffff62b2)),
                ),
              ),
            )
          ],
        ),
      ),
    );
    /*Align(
                alignment: Alignment(0, 0.1),
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: Color(0xffff62b2),
                  ),
                ),
              ),*/
  }
}
