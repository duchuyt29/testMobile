import 'package:flutter/material.dart';

import '../../styles/text_style/text_style.dart';

class WidgetCrmMultiSelectItem extends StatefulWidget {
  final List<dynamic> items;
  final List<int> selectedItems;
  const WidgetCrmMultiSelectItem(
      {Key? key, required this.selectedItems, required this.items})
      : super(key: key);

  @override
  State<WidgetCrmMultiSelectItem> createState() =>
      _WidgetCrmMultiSelectItemState();
}

class _WidgetCrmMultiSelectItemState extends State<WidgetCrmMultiSelectItem> {
  @override
  Widget build(BuildContext context) {
    return _buildLeadActivities();
  }

  Widget _buildLeadActivities() {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            const Divider(),
            Column(
              children: List.generate(
                  widget.items.length,
                  (index) => _buildFunctionCell(
                        title: widget.items[index],
                        icon: checkSelected(index + 1)
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_rounded,
                        ontap: () {
                          if (widget.selectedItems.isEmpty) {
                            widget.selectedItems.add(index + 1);
                          } else {
                            if (checkContains(index + 1)) {
                              widget.selectedItems.remove(index + 1);
                            } else {
                              widget.selectedItems.add(index + 1);
                            }
                          }
                          setState(() {});
                        },
                      )),
            ),
          ],
        ),
      ),
    );
  }

  bool checkSelected(int index) {
    return widget.selectedItems.any((element) => element == index);
  }

  bool checkContains(int index) {
    return widget.selectedItems.contains(index);
  }

  Widget _buildFunctionCell({
    required String title,
    required IconData icon,
    required GestureTapCallback ontap,
  }) {
    return Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          title: Text(
            title,
            style: AppTextStyle.heavy(fontSize: 16),
          ),
          leading: Container(
            height: 40,
            width: 40,
            child: Icon(icon, size: 25),
          ),
          onTap: ontap,
        ),
        // const Divider(height: 1),
      ],
    );
  }
}
