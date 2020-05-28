import 'package:flutter/material.dart';
import 'package:flutterchallenge02/animated_screen.dart';
import 'package:flutterchallenge02/inside_screen.dart';

class TripCard extends StatefulWidget {
  @override
  _TripCardState createState() => _TripCardState();
}

class _TripCardState extends State<TripCard>
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
    return Center(
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
              InsideScreen(
                title: 'For urban lovers',
                information:
                    'As cities never sleep, there are always something going on, no matter what time!',
              ),
              AnimatedScreen(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
