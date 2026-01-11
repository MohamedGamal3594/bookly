import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class PricePreviewButtons extends StatelessWidget {
  const PricePreviewButtons({super.key, required this.price});
  final double price;
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
                  onPressed: () {},
                  child: Text('$price€', textAlign: .center),
                ),
              ),
              Expanded(child: _PreviewButton(onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewButton extends StatelessWidget {
  const _PreviewButton({required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        backgroundColor: AppColors.orange,
        textStyle: TextStyle(fontWeight: .w200, fontSize: 22),
      ),
      child: Text('Free Preview', textAlign: .center),
    );
  }
}
