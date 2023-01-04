import 'package:flutter/material.dart';

class CrmWidgetSearchBar extends StatelessWidget {
  const CrmWidgetSearchBar(
      {Key? key, this.searchHint, required this.onTap, required this.label})
      : super(key: key);
  final String label;
  final String? searchHint;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 26,
            ),

            // helperText: "Search your topic",
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: label,
            labelStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade200,
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            isDense: true,
          ),
        ),
      ),
    );
  }
}
