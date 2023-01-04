class AlertRequest {
  AlertRequest({
    required this.description,
    this.title,
    this.buttonTitle,
  });

  final String? title;
  final String description;
  final String? buttonTitle;
}
