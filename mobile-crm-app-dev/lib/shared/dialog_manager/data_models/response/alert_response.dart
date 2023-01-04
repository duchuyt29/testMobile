class AlertResponse {
  AlertResponse({
    required this.confirmed,
    this.fieldOne,
    this.fieldTwo,
  });

  final String? fieldOne;
  final String? fieldTwo;
  final bool confirmed;
}
