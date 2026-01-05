import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _animation;
  @override
  void initState() {
    startSlideAnimation();
    super.initState();
  }

  void startSlideAnimation() async {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(begin: const Offset(-10, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.ease),
        );
    await _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Center(
        child: Text(
          AppConstants.kAppName,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
