import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(AppConstants.kAppName),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      floating: true,
    );
  }
}
