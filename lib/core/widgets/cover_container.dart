import 'package:flutter/material.dart';

class CoverContainer extends StatelessWidget {
  const CoverContainer({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: ClipRRect(
        borderRadius: .circular(16),
        child: Image.network(
          url,
          fit: .cover,
          loadingBuilder: (_, child, loadingProgress) =>
              Center(child: CircularProgressIndicator()),
          errorBuilder: (context, _, _) => Icon(Icons.error_outline_sharp),
        ),
      ),
    );
  }
}
