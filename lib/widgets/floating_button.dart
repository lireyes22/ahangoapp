import 'package:flutter/material.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    const double buttonSize = 70.0;
    final double bottomInset = scaffoldGeometry.scaffoldSize.height - buttonSize - 110.0; // Ajusta el valor para mover el botón hacia arriba

    return Offset(
      scaffoldGeometry.scaffoldSize.width - buttonSize - scaffoldGeometry.minInsets.right,
      bottomInset,
    );
  }
}