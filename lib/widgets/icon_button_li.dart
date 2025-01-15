import 'package:flutter/material.dart';

class IconButtonLi extends StatefulWidget {
  final Color? colorSelected;
  final Function(bool isSelected) onPressed;
  final Widget icon;
  final String label;
  final double spacing;
  const IconButtonLi({
    super.key,
    required this.onPressed,
    this.colorSelected,
    required this.icon,
    required this.label,
    this.spacing = 5.0,
  });

  @override
  State<IconButtonLi> createState() => _IconButtonLiState();
}

class _IconButtonLiState extends State<IconButtonLi> {
  bool isSelected = false; // Ahora es parte del estado

  @override
  Widget build(BuildContext context) {
    Color colorBtn = Theme.of(context).primaryColorDark;

    return IconButton.filled(
      onPressed: () {
        setState(() {
          isSelected = !isSelected; // Cambia el estado
        });
        widget.onPressed(isSelected); // Envía el estado actualizado
      },
      icon: Row(
        children: [
          SizedBox(width: widget.spacing),
          widget.icon,
          SizedBox(width: widget.spacing),
          Text(widget.label),
          SizedBox(width: widget.spacing),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isSelected ? (widget.colorSelected ?? colorBtn) : Colors.transparent,
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: (widget.colorSelected ?? colorBtn),
            width: 1.5,
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 5.0, // Reduce el padding horizontal
            vertical: 5.0, // Reduce el padding vertical
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
