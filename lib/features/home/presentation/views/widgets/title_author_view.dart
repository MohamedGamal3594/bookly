import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class TitleAuthorView extends StatelessWidget {
  const TitleAuthorView({
    super.key,
    required this.title,
    required this.author,
    this.isCollapsed = true,
  });
  final String title;
  final String author;
  final bool isCollapsed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: isCollapsed ? .center : .start,
      children: [
        _CollapsedText(
          text: title,
          style: context.textTheme.bodyLarge,
          isCollapsed: isCollapsed,
        ),
        _CollapsedText(
          text: author,
          style: context.textTheme.labelMedium?.copyWith(color: AppColors.grey),
          isCollapsed: isCollapsed,
        ),
      ],
    );
  }
}

class _CollapsedText extends StatelessWidget {
  const _CollapsedText({
    required this.text,
    required this.style,
    required this.isCollapsed,
  });

  final String text;
  final TextStyle? style;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: isCollapsed ? null : 2,
      overflow: isCollapsed ? null : .ellipsis,
      textAlign: isCollapsed ? .center : null,
    );
  }
}
