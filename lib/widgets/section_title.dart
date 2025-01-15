import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final Color cardColor;
  final String title;

  const SectionTitle({
    super.key,
    required this.cardColor,
    this.title = 'Example - Example',
  });
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: cardColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}