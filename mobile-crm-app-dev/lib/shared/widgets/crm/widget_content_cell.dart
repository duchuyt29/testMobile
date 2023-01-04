import 'package:flutter/material.dart';

class WidgetContentCell extends StatelessWidget {
  final String title;
  final String content;
  final GestureTapCallback? onTap;

  const WidgetContentCell(this.title, this.content, {Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        // decoration: BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(
        //       color: Colors.grey.shade200,
        //     ),
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 150, child: Text(title)),
                const SizedBox(width: 5),
                Expanded(child: Text(content))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
