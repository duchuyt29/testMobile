import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/widget_button.dart';
import '../widget_error.dart';

class WidgetRenameReminder extends StatefulWidget {
  final String name;
  final String error;
  final String caption;
  final Function(String) onSaveRenameReminder;

  WidgetRenameReminder(
      {Key? key,
      required this.name,
      required this.error,
      required this.caption,
      required this.onSaveRenameReminder})
      : super(key: key);

  @override
  State<WidgetRenameReminder> createState() => _WidgetRenameReminderState();
}

class _WidgetRenameReminderState extends State<WidgetRenameReminder> {
  final nameController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  String errorName = '';

  @override
  void initState() {
    errorName = widget.error;
    super.initState();
    nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                widget.caption,
                style: AppTextStyle.regular(color: AppColor.fourthTextColor),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(height: 24),
            Container(
              margin: const EdgeInsets.fromLTRB(48, 0, 24, 8),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: 'chat.option.rename.title'.tr,
                  style: AppTextStyle.heavy(fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: AppTextStyle.heavy(
                          color: AppColor.errorColor, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formGlobalKey,
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  style: AppTextStyle.heavy(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'chat.option.rename.hint'.tr,
                    suffixIcon: IconButton(
                      onPressed: () {
                        nameController.text = '';
                      },
                      icon: const Icon(Icons.cancel_sharp, size: 20),
                    ),
                    errorStyle: const TextStyle(height: 0),
                  ),
                  validator: validatorName,
                ),
              ),
            ),
            errorName.isEmpty
                ? Container()
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: WidgetError(error: errorName),
                  ),
            WidgetButton(
              title: 'save'.tr,
              margin: const EdgeInsets.all(24),
              onPressed: onSave,
            ),
          ],
        ),
      ),
    );
  }

  void onSave() {
    setState(() {
      errorName = '';
    });
    if (formGlobalKey.currentState != null &&
        formGlobalKey.currentState!.validate()) {
      Get.back();
      widget.onSaveRenameReminder(nameController.text);
    }
  }

  String? validatorName(String? name) {
    if (errorName.isNotEmpty) {
      return errorName;
    } else if (name == null || name.isEmpty) {
      setState(() {
        errorName = 'chat.option.rename.validate'.tr;
      });
    }
    return errorName.isEmpty ? null : '';
  }
}
