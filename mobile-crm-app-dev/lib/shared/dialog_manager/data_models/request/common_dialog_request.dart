class CommonDialogRequest {
  CommonDialogRequest({
    required this.description,
    this.title,
    this.typeDialog,
    this.isMustTapButton,
    this.okTextButton,
    this.cancelTextButton,
    this.defineEvent,
  });

  final String? title;
  final String description;
  final String? typeDialog;
  final bool? isMustTapButton;
  final String? okTextButton;
  final String? cancelTextButton;
  final String? defineEvent;
}
