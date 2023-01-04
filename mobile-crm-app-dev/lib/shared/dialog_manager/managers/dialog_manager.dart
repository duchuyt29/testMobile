import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data_models/request/common_dialog_request.dart';
import '../data_models/request/language_dialog_resquest.dart';
import '../data_models/response/common_dialog_response.dart';
import '../data_models/response/language_dialog_response.dart';
import '../data_models/type_dialog.dart';
import '../services/dialog_service.dart';
import '../view/chosen_language_dialog.dart';
import '../view/dialog_one_button.dart';
import '../view/dialog_two_button.dart';

class DialogManager extends StatefulWidget {
  const DialogManager({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = Get.find<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService
      ..showCommonDialogListener = _showDialog
      ..showLanguageDialogListener = _showLanguageDialog;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> _showDialog(CommonDialogRequest request) async {
    await showCupertinoDialog(
      context: context,
      barrierDismissible:
          request.isMustTapButton ?? false, // user must tap button!
      builder: (context) {
        return _chooseTypeDialog(request);
      },
    );
  }

  Future<void> _showLanguageDialog(LanguageDialogRequest request) async {
    await showCupertinoDialog(
      context: context,
      barrierDismissible:
          request.isMustTapButton ?? false, // user must tap button!
      builder: (context) {
        return _dialogLanguage(request);
      },
    );
  }

  Widget _chooseTypeDialog(CommonDialogRequest request) {
    switch (request.typeDialog) {
      case DIALOG_ONE_BUTTON:
        return _dialogOneButton(request);

      case DIALOG_TWO_BUTTON:
        return _dialogTwoButton(request);

      default:
        return _dialogOneButton(request);
    }
  }

  Widget _dialogOneButton(CommonDialogRequest request) {
    return DialogOneButton(
      title: request.title,
      content: request.description,
      textButton: request.okTextButton,
      onPressed: () async {
        _dialogService
            .commonDialogComplete(CommonDialogResponse(confirmed: true));
        // Hide popup
        Navigator.of(context).pop('dialog');
      },
    );
  }

  Widget _dialogTwoButton(CommonDialogRequest request) {
    return DialogTwoButton(
      title: request.title ?? 'info'.tr,
      content: request.description,
      agreeTextButton: request.okTextButton,
      cancelTextButton: request.cancelTextButton,
      onPressedAgree: () {
        _dialogService
            .commonDialogComplete(CommonDialogResponse(confirmed: true));
        Navigator.of(context).pop('dialog');
      },
      onPressedCancel: () {
        _dialogService
            .commonDialogComplete(CommonDialogResponse(confirmed: false));
        Navigator.of(context).pop('dialog');
      },
    );
  }

  Widget _dialogLanguage(LanguageDialogRequest request) {
    return ChosenLanguageDialog(
      languages: request.languages,
      onChooseLanguage: (language) {
        _dialogService
            .languageDialogComplete(LanguageDialogResponse(language: language));
        Navigator.of(context).pop('dialog');
      },
    );
  }
}
