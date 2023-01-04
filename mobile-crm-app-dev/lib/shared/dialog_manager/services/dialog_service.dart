import 'dart:async';

import '../data_models/request/common_dialog_request.dart';
import '../data_models/request/language_dialog_resquest.dart';
import '../data_models/response/common_dialog_response.dart';
import '../data_models/response/language_dialog_response.dart';

class DialogService {
  late Function(CommonDialogRequest) showCommonDialogListener;
  late Completer<CommonDialogResponse> _commonDialogCompleter;

  late Function(LanguageDialogRequest) showLanguageDialogListener;
  late Completer<LanguageDialogResponse> _languageDialogCompleter;

  Future<CommonDialogResponse> showDialog(CommonDialogRequest request) {
    _commonDialogCompleter = Completer<CommonDialogResponse>();
    showCommonDialogListener(CommonDialogRequest(
      title: request.title,
      description: request.description,
      typeDialog: request.typeDialog,
      okTextButton: request.okTextButton,
      isMustTapButton: request.isMustTapButton,
    ));
    return _commonDialogCompleter.future;
  }

  Future<LanguageDialogResponse> showLanguageDialog({
    required List<String> languages,
    bool isMustTapButton = false,
  }) {
    _languageDialogCompleter = Completer<LanguageDialogResponse>();
    showLanguageDialogListener(LanguageDialogRequest(
      languages: languages,
      isMustTapButton: isMustTapButton,
    ));
    return _languageDialogCompleter.future;
  }

  void commonDialogComplete(CommonDialogResponse response) {
    if (!_commonDialogCompleter.isCompleted) {
      _commonDialogCompleter.complete(response);
    }
  }

  void languageDialogComplete(LanguageDialogResponse response) {
    _languageDialogCompleter.complete(response);
  }
}
