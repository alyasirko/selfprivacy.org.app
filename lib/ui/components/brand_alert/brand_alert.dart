import 'package:flutter/material.dart';

class BrandAlert extends AlertDialog {
  BrandAlert({
    Key? key,
    String? title,
    String? contentText,
    List<Widget>? actions,
  }) : super(
          key: key,
          title: title != null ? Text(title) : null,
          content: title != null ? Text(contentText!) : null,
          actions: actions,
        );
}
