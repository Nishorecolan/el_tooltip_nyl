import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Corner extends CustomPainter {
  final Color color;

  Corner({this.color = const Color(0xff000000)});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = color;
    path = Path();
    path.lineTo(0, size.height * 0.69);
    path.cubicTo(0, size.height * 0.95, size.width * 0.18, size.height * 1.09,
        size.width * 0.31, size.height * 0.93);
    path.cubicTo(
        size.width * 0.31, size.height * 0.93, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.69, 0, size.height * 0.69);
    path.cubicTo(
        0, size.height * 0.69, 0, size.height * 0.69, 0, size.height * 0.69);
    Path shadowPath = path.shift(Offset(-0.5, .8));
    paint.color = Colors.grey.shade400; // Shadow color with opacity
    canvas.drawPath(shadowPath, paint);
    canvas.drawShadow(
      path,
      Colors.transparent, // Shadow color
      0.0, // Blur radius
      true, // Should include shape in shadow
    );
    paint.color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
