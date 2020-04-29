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
      body: Container(
        color: Color(0xFFEAE2D5),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Stack(
              children: <Widget>[
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
      ),
    );
  }
}
