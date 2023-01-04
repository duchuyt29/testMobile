import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class ChosenLanguageDialog extends StatelessWidget {
  const ChosenLanguageDialog({
    required this.languages,
    required this.onChooseLanguage,
  });

  final List<String> languages;
  final Function(String) onChooseLanguage;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
    );
  }

  Widget _dialogContent(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.primaryBackgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Text(
            'chosen_language'.tr.toUpperCase(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColor.primaryTextColor,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: listLanguage(context, languages),
          )
        ],
      ),
    );
  }

  List<Widget> listLanguage(BuildContext context, List<String> languages) {
    final listWidget = <Widget>[];
    for (final language in languages) {
      listWidget.add(detailLanguageWidget(context, language));
    }
    return listWidget;
  }

  Widget detailLanguageWidget(BuildContext context, String language) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            onChooseLanguage(language);
          },
          child: Card(
            color: AppColor.primaryBackgroundColor,
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              width: width,
              height: 40,
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    language.tr.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next, color: AppColor.primaryTextColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
