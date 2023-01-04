import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrmWidgetButton extends StatelessWidget {
  const CrmWidgetButton({
    Key? key,
    required this.bgColor,
    required this.icon,
    required this.onTap,
    this.border,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color bgColor;
  final Widget icon;
  final Function() onTap;
  final Border? border;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: height ?? 30,
            width: width ?? 30,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius:
                    radius ?? const BorderRadius.all(Radius.circular(25)),
                border: border),
            child: icon,
          ),
        ),
      ],
    );
  }
}
