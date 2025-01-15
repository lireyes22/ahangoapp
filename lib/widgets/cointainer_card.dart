import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Color? cardColor;
  final Widget? child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;

  const ContainerCard({
    super.key,
    this.cardColor,
    this.child,
    this.margin = const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 20.0,
    ),
    this.padding = const EdgeInsets.all(20.0),
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}
