import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedContainer extends StatelessWidget {
  final double height;
  final double weight;
  final Widget childg;
  final double blurSigma;
  final VoidCallback? onTap;

  const FrostedContainer({
    super.key,
    required this.height,
    required this.weight,
    required this.childg,
    this.blurSigma = 5.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            height: height,
            width: weight,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: childg,
          ),
        ),
      ),
    );
  }
}
