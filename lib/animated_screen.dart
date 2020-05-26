import 'dart:math';
import 'package:flutter/material.dart';
import 'cover_screen.dart';
import 'image_screen.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Widget visibleScreen = Container();

  Widget getScreen() {
    if (_animation.value < 0.5) {
      visibleScreen = CoverScreen();
    } else {
      visibleScreen = ImageScreen();
    }
    return visibleScreen;
  }

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
      onTap: () {
        if(_controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: Transform(
        transform: Matrix4.rotationY(pi * _animation.value),
        child: getScreen(),
      ),
    );
  }
}
