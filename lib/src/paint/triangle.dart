import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Triangle extends CustomPainter {
  final Color color;

  Triangle({this.color = const Color(0xff000000)});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.isAntiAlias = true;
    paint.color = color;

    Path path = Path();
    path.lineTo(size.width * 0.66, size.height * 0.86);
    path.cubicTo(size.width * 0.58, size.height * 1.05, size.width * 0.42,
        size.height * 1.05, size.width * 0.34, size.height * 0.86);
    path.cubicTo(size.width * 0.34, size.height * 0.86, 0, 0, 0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.66, size.height * 0.86,
        size.width * 0.66, size.height * 0.86);
    path.cubicTo(size.width * 0.66, size.height * 0.86, size.width * 0.66,
        size.height * 0.86, size.width * 0.66, size.height * 0.86);
    Path shadowPath = path.shift(Offset(0, 1.0));
    paint.color = Colors.grey.shade400;
    canvas.drawPath(shadowPath, paint);
    canvas.drawShadow(
      path,
      Colors.grey, // Shadow color
      1.0, // Blur radius
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
