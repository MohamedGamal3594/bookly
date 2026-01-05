import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    super.initState();
    _goToHomeView();
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

  void _goToHomeView() async {
    await _startSlideAnimation();
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      context.go(AppRouter.homeView);
    }
  }

  Future<void> _startSlideAnimation() async {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(begin: const Offset(0, -10), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.ease),
        );
    await _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
