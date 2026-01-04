import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppConstants.kAppName,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
