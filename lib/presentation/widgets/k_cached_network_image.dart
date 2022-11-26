import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KCachedNetworkImage extends StatelessWidget {
  const KCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    const defaultImage =
        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height ?? double.infinity,
        maxWidth: width ?? double.infinity,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl.isNotEmpty ? imageUrl : defaultImage,
        fit: fit,
        imageBuilder: (context, imageProvider) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Colors.grey[200],
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: child,
            ),
          );
        },
        height: height,
        width: width,
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: SizedBox(
            height: 30.h,
            width: 30.h,
            child: CircularProgressIndicator(
              value: progress.progress,
              strokeWidth: .8.w,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        // placeholder: (context, url) => const Icon(Icons.error),
      ),
    );
  }
}
