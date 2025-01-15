import 'package:ahangoapp/config/config.dart';
import 'package:flutter/material.dart';

class IconButtonInk extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final double? size;
  const IconButtonInk({
    super.key,
    required this.onTap,
    required this.icon,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Material(
      color: Theme.of(context).primaryColorDark,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            icon,
            color: customColors?.colorOne,
            size: size,
          ),
        ),
      ),
    );
  }
}