import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key, required this.rating, required this.votes});
  final String rating;
  final String votes;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .baseline,
      textBaseline: .alphabetic,
      children: [
        Transform.translate(
          offset: const Offset(0, 5),
          child: Icon(Icons.star_rate_rounded, color: AppColors.yellow),
        ),
        Text(
          rating,
          style: context.textTheme.labelMedium?.copyWith(fontWeight: .bold),
        ),
        const SizedBox(width: 3),
        Text('($votes)', style: context.textTheme.labelSmall),
      ],
    );
  }
}
