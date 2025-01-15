import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String assetName;
  final double height;
  final double width;

  const SvgAsset(
    this.assetName, {
    super.key,
    this.height = 24.0,
    this.width = 24.0,
  });

  @override
  Widget build(BuildContext context) {

    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
    );
  }
}
