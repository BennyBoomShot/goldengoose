class MenuExtractionResult {
  final String? imagePath;
  final String? text;
  final String? error;
  final bool isSuccess;

  MenuExtractionResult._({this.imagePath, this.text, this.error, required this.isSuccess});

  factory MenuExtractionResult.success(String imagePath, String text) =>
      MenuExtractionResult._(imagePath: imagePath, text: text, isSuccess: true);

  factory MenuExtractionResult.failure(String error) =>
      MenuExtractionResult._(error: error, isSuccess: false);
} 