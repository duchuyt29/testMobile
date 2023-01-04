import 'package:flutter/material.dart';

class WidgetIconButton extends StatelessWidget {
  final double size;
  final Color? backgroundColor;
  final Color iconColor;
  final IconData? icon;
  final VoidCallback? onPressed;

  const WidgetIconButton(
      {Key? key,
      this.size = 30,
      this.backgroundColor,
      this.iconColor = Colors.white,
      this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        ),
        child: Icon(icon, color: iconColor, size: size / 2),
      ),
    );
  }
}
