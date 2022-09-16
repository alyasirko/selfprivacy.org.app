import 'package:flutter/material.dart';

class BrandLinearIndicator extends StatelessWidget {
  const BrandLinearIndicator({
    required this.value,
    required this.color,
    required this.backgroundColor,
    required this.height,
    final super.key,
  });

  final double value;
  final Color color;
  final Color backgroundColor;
  final double height;

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final context, final constraints) => Container(
          height: height,
          width: constraints.maxWidth,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(height),
          ),
          alignment: Alignment.centerLeft,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            offset: Offset(
              -(1 - value),
              0,
            ),
            child: Container(
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(height),
              ),
            ),
          ),
        ),
      );
}
