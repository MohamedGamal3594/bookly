import 'package:flutter/material.dart';

class CoverView extends StatelessWidget {
  const CoverView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: ClipRRect(
        borderRadius: .circular(8),
        child: Image.network(
          url,
          fit: .cover,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : Center(child: CircularProgressIndicator()),
          errorBuilder: (context, _, _) =>
              Icon(Icons.image_not_supported_outlined),
        ),
      ),
    );
  }
}
