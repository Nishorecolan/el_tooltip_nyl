import 'package:flutter/material.dart';
import 'enum/nyl_tooltip_position.dart';
import 'paint/corner.dart';
import 'paint/triangle.dart';

class Arrow extends StatelessWidget {
  final Color color;
  final NYLTooltipPosition position;
  final double width;
  final double height;
  const Arrow({
    required this.color,
    required this.position,
    this.width = 16.0,
    this.height = 10.0,
    super.key,
  });
  CustomPainter? _getElement(bool isArrow) {
    return isArrow ? Triangle(color: color) : Corner(color: color);
  }
  Widget _getTriangle() {
    double scaleX = 1;
    double scaleY = 1;
    bool isArrow = false;
    int quarterTurns = 0;

    switch (position) {
      case NYLTooltipPosition.topStart:
        break;
      case NYLTooltipPosition.topCenter:
        quarterTurns = 0;
        isArrow = true;
        break;
      case NYLTooltipPosition.topEnd:
        scaleX = -1;
        break;
      case NYLTooltipPosition.bottomStart:
        scaleY = -1;
        break;
      case NYLTooltipPosition.bottomCenter:
        quarterTurns = 2;
        isArrow = true;
        break;
      case NYLTooltipPosition.bottomEnd:
        scaleX = -1;
        scaleY = -1;
        break;
      case NYLTooltipPosition.leftStart:
        scaleY = -1;
        quarterTurns = 3;
        break;
      case NYLTooltipPosition.leftEnd:
        quarterTurns = 3;
        break;
      case NYLTooltipPosition.rightStart:
        quarterTurns = 1;
        break;
      case NYLTooltipPosition.rightEnd:
        quarterTurns = 1;
        scaleY = -1;
        break;
    }

    return Transform.scale(
      scaleX: scaleX,
      scaleY: scaleY,
      child: RotatedBox(
        quarterTurns: quarterTurns,
        child: CustomPaint(
          size: Size(width, height),
          painter: _getElement(isArrow),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getTriangle();
  }
}
