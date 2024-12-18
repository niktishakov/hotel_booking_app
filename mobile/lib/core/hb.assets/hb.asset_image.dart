import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'hb.asset.dart';

class HbAssetImage extends StatelessWidget {
  const HbAssetImage(
    this.asset, {
    Key? key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final HbAsset asset;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    switch (asset.type) {
      case HbAssetType.vector:
        return SvgPicture.asset(
          asset.path,
          width: width,
          height: height,
          color: color,
          fit: fit,
          alignment: alignment,
        );

      case HbAssetType.bitmap:
        return ExcludeSemantics(
          child: Image.asset(
            asset.path,
            width: width,
            height: height,
            color: color,
            fit: fit,
            alignment: alignment,
          ),
        );
      default:
        return Container();
    }
  }
}
