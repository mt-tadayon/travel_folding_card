import 'package:flutter/material.dart';
import 'widgets/animated_button.dart';

class InsideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xfffafbfa),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 2.5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('For urban lovers',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff62b2))),
          SizedBox(
            height: 10.0,
          ),
          Text(
              'As cities never sleep, there are always something going on, no matter what time!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
              )),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 40.0,
            child: AnimatedButton(
              width: 120.0,
              height: 40,
              color: Color(0xffff62b2),
              buttonText: 'View details',
            ),
          )
        ],
      ),
    );
  }
}
