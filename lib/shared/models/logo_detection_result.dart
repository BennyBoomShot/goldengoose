class LogoDetectionResult {
  final String? imagePath;
  final List<String>? logos;
  final String? error;
  final bool isSuccess;

  LogoDetectionResult._({this.imagePath, this.logos, this.error, required this.isSuccess});

  factory LogoDetectionResult.success(String imagePath, List<String> logos) =>
      LogoDetectionResult._(imagePath: imagePath, logos: logos, isSuccess: true);

  factory LogoDetectionResult.failure(String error) =>
      LogoDetectionResult._(error: error, isSuccess: false);
} 