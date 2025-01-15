import 'package:ahangoapp/widgets/widgetsli.dart';
import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {

  final List<IconButtonLi> children;
  final double margin;
  const FilterRow({
    super.key,
    required this.children,
    this.margin = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(var filterButton in children) ...[
            filterButton,
            SizedBox(width: margin),
          ]
        ],
      ),
    );
  }
}