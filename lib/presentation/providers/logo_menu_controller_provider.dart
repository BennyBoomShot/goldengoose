import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/features/business/controllers/logo_menu_controller.dart';
import 'package:goldengoose/presentation/providers/image_service_provider.dart';
import 'package:goldengoose/presentation/providers/text_recognition_service_provider.dart';
import 'package:goldengoose/presentation/providers/cloud_vision_service_provider.dart';

final logoMenuControllerProvider = Provider<LogoMenuController>((ref) {
  final imageService = ref.read(imageServiceProvider);
  final textRecognitionService = ref.read(textRecognitionServiceProvider);
  final cloudVisionService = ref.read(cloudVisionServiceProvider);
  return LogoMenuController(
    imageService: imageService,
    textRecognitionService: textRecognitionService,
    cloudVisionService: cloudVisionService,
  );
}); 