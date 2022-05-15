import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sanskar_pg_app/utils/theme/color_palette.dart';
import 'package:shimmer/shimmer.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final IconData? errorIcon;

  const ImageNetwork(
      {Key? key,
      required this.imageUrl,
      this.fit,
      this.width,
      this.height,
      this.errorIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                color: ColorPalette.lightGrey,
              ),
            ),
        errorWidget: (context, url, error) => Icon(errorIcon ?? Icons.image),
        width: width,
        height: height);
  }
}
