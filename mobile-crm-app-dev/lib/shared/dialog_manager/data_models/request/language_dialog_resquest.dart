class LanguageDialogRequest {
  LanguageDialogRequest({
    required this.languages,
    this.isMustTapButton = false,
  });

  final List<String> languages;
  final bool? isMustTapButton;
}
