import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  color: Color(0xfffafbfa),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('For urban lovers',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffff62b2))),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                          'As cities never sleep, there are always something going on, no matter what time!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 40.0,
                        child: AnimatedButton(
                          width: 120.0,
                          height: 120,
                          color: Color(0xffff62b2),
                          buttonText: 'View details',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(40.0),
                    decoration: BoxDecoration(color: Color(0xffff62b2)),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.build,
                          color: Colors.white,
                          size: 32.0,
                        ),
                        Text(
                          'City break',
                          style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'From €29',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    color: Colors.white,
                    child: Text(
                      'View me',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffff62b2)),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment(0, 0.1),
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: Color(0xffff62b2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final double height;
  final double width;
  final String buttonText;
  final Color color;

  AnimatedButton({this.height, this.width, this.buttonText, this.color});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Color textColor;

  @override
  void initState() {
    super.initState();
    textColor = widget.color;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: widget.height).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: controller,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(width: 3.0, color: widget.color),
          ),
          child: InkWell(
              onHover: (value) {
                if (value) {
                  controller.forward();
                  setState(() {
                    textColor = Colors.white;
                  });
                } else {
                  controller.reverse();
                  setState(() {
                    textColor = widget.color;
                  });
                }
              },
              onTap: () {
                print('Hello');
              },
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: animation.value,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedDefaultTextStyle(
                      child: Text(widget.buttonText),
                      duration: Duration(milliseconds: 200),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      curve: Curves.easeIn,
                    ),
                  )
                ],
              )),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
