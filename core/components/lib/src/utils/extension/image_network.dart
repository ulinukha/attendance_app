import 'package:cached_network_image/cached_network_image.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color color;
  final BoxBorder? border;
  final BoxFit? boxFit;
  final Widget? errorView;

  const ImageNetwork(
    this.url, {
    this.width,
    this.height,
    this.borderRadius,
    this.color = DsColors.backgroundGrey,
    this.border,
    this.boxFit,
    this.errorView,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        border: border,
        shape: BoxShape.rectangle
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: boxFit,
          placeholder: (context, url) => const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => errorView ?? 
            Container(
              decoration: const BoxDecoration(
                color: DsColors.dsGrey50,
              ),
              child: const Icon(
                Icons.image,
                color: DsColors.dsWhite,
                size: 16,
              ).marginAll(4),
            ),
        ),
      ),
    );
  }
}
