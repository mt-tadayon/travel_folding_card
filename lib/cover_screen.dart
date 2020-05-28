import 'package:flutter/material.dart';
import 'package:flutterchallenge02/constant.dart';

class CoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_city,
                  color: Colors.white,
                  size: 32.0,
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
                    color: const Color(0xffffffff),
                  ),
                )
              ],
            ),
          ),
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              color: const Color(0xffffffff),
              height: 50,
              width: 200,
              child: Center(
                child: Text(
                  'View me',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffff62b2),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 2 - 10, 0);
    path.lineTo(size.width / 2, 10.0);
    path.lineTo(size.width / 2 + 10, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
