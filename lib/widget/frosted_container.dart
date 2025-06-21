import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedContainer extends StatelessWidget {
  final double? height;
  final double? width; // Renamed from "weight"
  final Widget childg;
  final double blurSigma;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const FrostedContainer({
    super.key,
    this.height,
    this.width,
    required this.childg,
    this.blurSigma = 6.0,
    this.onTap,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              height: height,
              width: width,
              padding: padding ?? const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08), // softer for contrast
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: childg,
            ),
          ),
        ),
      ),
    );
  }
}
