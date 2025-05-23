import 'package:goldengoose/core/services/image_service.dart';
import 'package:goldengoose/core/services/text_recognition_service.dart';
import 'package:goldengoose/core/services/cloud_vision_service.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/models/logo_detection_result.dart';
import '../../../shared/models/menu_extraction_result.dart';

class LogoMenuController {
  final ImageService imageService;
  final TextRecognitionService textRecognitionService;
  final CloudVisionService cloudVisionService;

  LogoMenuController({
    required this.imageService,
    required this.textRecognitionService,
    required this.cloudVisionService,
  });

  /// Captures a photo using the camera and attempts to detect logos in the image.
  /// Returns a [LogoDetectionResult] with detected logos or error info.
  Future<LogoDetectionResult> captureAndDetectLogo(String apiKey) async {
    try {
      final XFile? image = await imageService.pickImageFromCamera();
      if (image == null) {
        return LogoDetectionResult.failure('No image captured');
      }
      final logos = await cloudVisionService.detectLogosWithCloudVision(image.path, apiKey);
      return LogoDetectionResult.success(image.path, logos);
    } catch (e) {
      return LogoDetectionResult.failure(e.toString());
    }
  }

  /// Captures a photo using the camera and attempts to extract menu text using OCR.
  /// Returns a [MenuExtractionResult] with extracted text or error info.
  Future<MenuExtractionResult> captureAndExtractMenuText() async {
    try {
      final XFile? image = await imageService.pickImageFromCamera();
      if (image == null) {
        return MenuExtractionResult.failure('No image captured');
      }
      final text = await textRecognitionService.extractTextFromImage(image.path);
      return MenuExtractionResult.success(image.path, text);
    } catch (e) {
      return MenuExtractionResult.failure(e.toString());
    }
  }

  /// Returns an [XFile] by calling the imageService's pickImageFromCamera method.
  Future<XFile?> captureImage() async {
    return await imageService.pickImageFromCamera();
  }

  /// Extracts menu text from the given image path using the textRecognitionService.
  Future<String> extractMenuText(String imagePath) async {
    return await textRecognitionService.extractTextFromImage(imagePath);
  }

  /// Detects logos in the given image path using the cloudVisionService and apiKey.
  Future<List<String>> detectLogos(String imagePath, String apiKey) async {
    return await cloudVisionService.detectLogosWithCloudVision(imagePath, apiKey);
  }
} 