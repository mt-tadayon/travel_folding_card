
import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
