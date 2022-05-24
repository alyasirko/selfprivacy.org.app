import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class BrandLoader {
  static horizontal() => _HorizontalLoader();
}

class _HorizontalLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('basis.wait'.tr()),
        const SizedBox(height: 10),
        const LinearProgressIndicator(minHeight: 3),
      ],
    );
  }
}
