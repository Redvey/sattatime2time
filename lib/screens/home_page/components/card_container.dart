import 'package:flutter/material.dart';


class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
    required this.height,
    this.width = double.infinity, required this.color,
  });

  final Widget child;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: child,
    );
  }
}