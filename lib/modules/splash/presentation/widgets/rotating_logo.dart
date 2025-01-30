import 'package:flutter/material.dart';

class RotatingLogo extends StatelessWidget {
  final Animation<double> animation;

  const RotatingLogo({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return RotationTransition(
          turns: animation,
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