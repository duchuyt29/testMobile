import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/text_style/text_style.dart';

class MenuOptionModel {
  GestureTapCallback? onAction;
  String? title;
  MenuOptionModel({
    this.onAction,
    this.title,
  });
}

class WidgetCrmMenuOption extends StatelessWidget {
  final String? title;

  final List<MenuOptionModel> option;

  const WidgetCrmMenuOption({
    Key? key,
    this.title,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLeadActivities();
  }

  Widget _buildLeadActivities() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Text(
            title ?? '',
            style: AppTextStyle.heavy(fontSize: 18),
          ),
        ),
        const Divider(height: 1),
        ...List.generate(
          option.length,
          (index) {
            return _buildFunctionCell(
              title: option[index].title ?? '',
              ontap: option[index].onAction!,
            );
          },
        ),
      ],
    );
  }

  Widget _buildFunctionCell({
    required String title,
    required GestureTapCallback ontap,
  }) {
    return Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.heavy(fontSize: 18, color: Colors.blue),
          ),
          onTap: ontap,
        ),
        const Divider(height: 1),
      ],
    );
  }
}
