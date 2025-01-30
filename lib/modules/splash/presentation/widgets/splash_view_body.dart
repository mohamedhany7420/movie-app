import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/modules/splash/presentation/widgets/sliding_text.dart';
import 'rotating_logo.dart'; // Import the new RotatingLogo widget

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late AnimationController logoAnimationController;
  late Animation<double> logoAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initLogoAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatingLogo(animation: logoAnimation),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
  void initLogoAnimation() {
    logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    logoAnimation = Tween<double>(
      begin: -0.1, // Slight left rotation
      end: 0.1,   // Slight right rotation
    ).animate(CurvedAnimation(
      parent: logoAnimationController,
      curve: Curves.easeInOut,
    ));
    logoAnimationController.repeat(reverse: true); // Repeat the animation to oscillate
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).push('/MovieView');
    });
  }
}