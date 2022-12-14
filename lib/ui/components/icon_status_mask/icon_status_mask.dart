import 'package:flutter/material.dart';
import 'package:selfprivacy/config/brand_colors.dart';
import 'package:selfprivacy/logic/models/state_types.dart';

class IconStatusMask extends StatelessWidget {
  const IconStatusMask({
    required this.child,
    required this.status,
    final super.key,
  });
  final Icon child;

  final StateType status;

  @override
  Widget build(final BuildContext context) {
    late List<Color> colors;
    switch (status) {
      case StateType.uninitialized:
        colors = BrandColors.uninitializedGradientColors;
        break;
      case StateType.stable:
        colors = [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.tertiary,
        ];
        break;
      case StateType.warning:
        colors = BrandColors.warningGradientColors;
        break;
      case StateType.error:
        colors = [
          Theme.of(context).colorScheme.error,
          Theme.of(context).colorScheme.error,
        ];
        break;
    }
    return ShaderMask(
      shaderCallback: (final bounds) => LinearGradient(
        begin: const Alignment(-1, -0.8),
        end: const Alignment(0.9, 0.9),
        colors: colors,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
