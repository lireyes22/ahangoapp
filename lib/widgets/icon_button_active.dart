import 'package:flutter/material.dart';

class IconButtonActive extends StatefulWidget {
  final Function(bool isActive) onTap;
  final Widget iconSelected;
  final Widget iconNotSelected;
  const IconButtonActive({
    super.key,
    required this.onTap,
    required this.iconSelected,
    required this.iconNotSelected,
  });

  @override
  State<IconButtonActive> createState() => _IconButtonActiveState();
}

class _IconButtonActiveState extends State<IconButtonActive> {
  bool isActive = false; // Ahora es parte del estado

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {
          setState(() {
            isActive = !isActive;
          });
          widget.onTap(isActive);
        },
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: isActive ? widget.iconSelected : widget.iconNotSelected,
        ),
      ),
    );
  }
}

/**
 * Material(
                color: Colors.transparent,
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ),
              )
 */