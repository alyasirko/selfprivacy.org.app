import 'package:flutter/material.dart';
import 'package:selfprivacy/config/brand_colors.dart';
import 'package:selfprivacy/config/text_themes.dart';

class NavigationService {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get navigator => navigatorKey.currentState;

  void showPopUpDialog(final AlertDialog dialog) {
    final BuildContext context = navigatorKey.currentState!.overlay!.context;

    showDialog(
      context: context,
      builder: (final _) => dialog,
    );
  }

  void showSnackBar(final String text) {
    final ScaffoldMessengerState state = scaffoldMessengerKey.currentState!;
    final SnackBar snack = SnackBar(
      backgroundColor: BrandColors.black.withOpacity(0.8),
      content: Text(text, style: buttonTitleText),
      duration: const Duration(seconds: 2),
    );
    state.showSnackBar(snack);
  }
}
