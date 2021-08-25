import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(55, 20, 55, 60);
    path.lineTo(55, size.height-60);
    path.quadraticBezierTo(55, size.height - 20, 0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}