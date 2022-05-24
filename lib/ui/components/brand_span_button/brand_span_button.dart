import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:selfprivacy/config/brand_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class BrandSpanButton extends TextSpan {
  BrandSpanButton({
    required String text,
    required VoidCallback onTap,
    TextStyle? style,
  }) : super(
          recognizer: TapGestureRecognizer()..onTap = onTap,
          text: text,
          style: (style ?? const TextStyle()).copyWith(color: BrandColors.blue),
        );

  static link({
    required String text,
    String? urlString,
    TextStyle? style,
  }) =>
      BrandSpanButton(
        text: text,
        style: style,
        onTap: () => _launchURL(urlString ?? text),
      );

  static _launchURL(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link));
    } else {
      throw 'Could not launch $link';
    }
  }
}
