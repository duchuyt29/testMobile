import 'package:flutter/material.dart';

import '../../styles/text_style/text_style.dart';

class CrmWidgetTitleComponent extends StatelessWidget {
  final String title;
  final String? titleAction;
  final VoidCallback? onTap;

  const CrmWidgetTitleComponent({
    Key? key,
    required this.title,
    this.titleAction,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10),
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              title,
              style: AppTextStyle.bold(fontSize: 16),
            ),
          ),
          if (onTap != null)
            TextButton(
              onPressed: onTap,
              child: Text(
                titleAction ?? '',
                style: AppTextStyle.regular(color: Colors.blue, fontSize: 14),
              ),
            ),
        ],
      ),
    );
  }
}
