import 'package:flutter/material.dart';
class Modal extends StatelessWidget {
  final bool visible;
  final Color color;
  final double opacity;
  final void Function()? onTap;

  const Modal({
    required this.onTap,
    this.visible = true,
    this.color = Colors.black,
    this.opacity = 0.6,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (visible) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          color: color.withOpacity(opacity),
        ),
      );
    } else {
      return Container();
    }
  }
}
