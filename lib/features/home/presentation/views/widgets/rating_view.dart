import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .baseline,
      textBaseline: .alphabetic,
      children: [
        Transform.translate(
          offset: const Offset(0, 5),
          child: FaIcon(Icons.star_rate_rounded, color: AppColors.yellow),
        ),
        Text(
          '4.8',
          style: context.textTheme.labelMedium?.copyWith(fontWeight: .bold),
        ),
        const SizedBox(width: 3),
        Text('(2390)', style: context.textTheme.labelSmall),
      ],
    );
  }
}
