import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets/image_page.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 2.5,
          )
        ]
      ),
      child: kIsWeb ? Container(
        child: Image(
          image: NetworkImage('https://i.picsum.photos/id/679/200/200.jpg'),
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
