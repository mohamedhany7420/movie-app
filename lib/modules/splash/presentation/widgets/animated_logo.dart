import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final Animation<double> animation;

  const AnimatedLogo({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Image.asset(
            'assets/images/logo.png',
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        );
      },
    );
  }
}