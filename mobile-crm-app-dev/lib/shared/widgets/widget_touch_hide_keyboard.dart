import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class WidgetTouchHideKeyBoard extends StatelessWidget {
  final Widget child;

  const WidgetTouchHideKeyBoard({required this.child});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: child,
    );
  }
}
