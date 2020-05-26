import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets/image_page.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: kIsWeb ? Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image.jpg'),
              fit: BoxFit.cover
          ),
        ),
      ): ClipPath(
        clipper: RightCornerClipper(),
        child: ImagePage()
      ),
    );
  }
}

class RightCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(20, size.height / 2 );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
