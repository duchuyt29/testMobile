import 'package:flutter/material.dart';

class CrmWidgetTextFormField extends StatelessWidget {
  const CrmWidgetTextFormField({
    Key? key,
    this.searchHint,
    required this.onComplete,
    required this.label,
    this.controller,
  }) : super(key: key);
  final String label;
  final String? searchHint;
  final Function() onComplete;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        controller: controller,
        onEditingComplete: onComplete,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
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
    );
  }
}
