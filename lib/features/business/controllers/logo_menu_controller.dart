import 'package:goldengoose/core/services/image_service.dart';
import 'package:goldengoose/core/services/text_recognition_service.dart';
import 'package:goldengoose/core/services/cloud_vision_service.dart';
import 'package:image_picker/image_picker.dart';

class LogoMenuController {
  final ImageService imageService;
  final TextRecognitionService textRecognitionService;
  final CloudVisionService cloudVisionService;

  LogoMenuController({
    required this.imageService,
    required this.textRecognitionService,
    required this.cloudVisionService,
  });

  Future<XFile?> captureImage() async {
    return await imageService.pickImageFromCamera();
  }

  Future<String> extractMenuText(String imagePath) async {
    return await textRecognitionService.extractTextFromImage(imagePath);
  }

  Future<List<String>> detectLogos(String imagePath, String apiKey) async {
    return await cloudVisionService.detectLogosWithCloudVision(imagePath, apiKey);
  }
} 