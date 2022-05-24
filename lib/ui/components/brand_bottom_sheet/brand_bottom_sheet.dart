import 'package:flutter/material.dart';
import 'package:selfprivacy/config/brand_colors.dart';

class BrandBottomSheet extends StatelessWidget {
  const BrandBottomSheet({
    Key? key,
    required this.child,
    this.isExpended = false,
  }) : super(key: key);

  final Widget child;
  final bool isExpended;

  @override
  Widget build(BuildContext context) {
    var mainHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        100;
    late Widget innerWidget;
    if (isExpended) {
      innerWidget = Scaffold(
        body: child,
      );
    } else {
      final ThemeData themeData = Theme.of(context);

      innerWidget = Material(
        color: themeData.scaffoldBackgroundColor,
        child: IntrinsicHeight(child: child),
      );
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: mainHeight + 4 + 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: BrandColors.gray4,
              ),
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: mainHeight),
              child: innerWidget,
            ),
          ),
        ],
      ),
    );
  }
}
