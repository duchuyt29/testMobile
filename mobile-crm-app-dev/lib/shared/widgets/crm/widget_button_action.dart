import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrmWidgetButtonAction extends StatelessWidget {
  const CrmWidgetButtonAction(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.icon,
      required this.onTap,
      this.border})
      : super(key: key);

  final String title;
  final Color bgColor;
  final Widget icon;
  final Function() onTap;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                border: border),
            child: icon,
          ),
        ),
        Text(title),
      ],
    );
  }
}
