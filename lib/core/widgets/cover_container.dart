import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoverView extends StatelessWidget {
  const CoverView({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: ClipRRect(
        borderRadius: .circular(8),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: .cover,
          progressIndicatorBuilder: (_, _, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (_, _, _) =>
              const Icon(Icons.image_not_supported_outlined),
        ),
      ),
    );
  }
}
