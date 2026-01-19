import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PricePreviewButtons extends StatelessWidget {
  const PricePreviewButtons({
    super.key,
    this.price,
    required this.buyLink,
    required this.previewLink,
  });
  final String? price;
  final String? buyLink;
  final String? previewLink;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: AppConstants.kPhoneBreakPoint),
      child: SizedBox(
        height: 60,
        width: context.viewSize.width * 0.85,
        child: ClipRRect(
          borderRadius: .circular(16),
          child: Row(
            crossAxisAlignment: .stretch,
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: buyLink == null
                      ? null
                      : () => _launchUrl(context, url: buyLink!),
                  child: Text(
                    price == null
                        ? buyLink == null
                              ? 'Not Available'
                              : 'Free'
                        : '$price€',
                    textAlign: .center,
                  ),
                ),
              ),
              Expanded(
                child: _PreviewButton(
                  onPressed: previewLink == null
                      ? null
                      : () => _launchUrl(context, url: previewLink!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context, {required String url}) async {
    try {
      await launchUrl(Uri.parse(url), mode: .externalApplication);
    } catch (_) {
      if (context.mounted) context.showSnackBar('Failed to launch URL!');
    }
  }
}

class _PreviewButton extends StatelessWidget {
  const _PreviewButton({required this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        backgroundColor: AppColors.orange,
        textStyle: TextStyle(fontWeight: .w200, fontSize: 20),
      ),
      child: Text('Free Preview', textAlign: .center),
    );
  }
}
