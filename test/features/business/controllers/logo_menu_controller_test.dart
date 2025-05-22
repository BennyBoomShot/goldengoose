import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:goldengoose/features/business/controllers/logo_menu_controller.dart';
import 'package:goldengoose/core/services/image_service.dart';
import 'package:goldengoose/core/services/text_recognition_service.dart';
import 'package:goldengoose/core/services/cloud_vision_service.dart';
import 'package:image_picker/image_picker.dart';

class MockImageService extends Mock implements ImageService {}
class MockTextRecognitionService extends Mock implements TextRecognitionService {}
class MockCloudVisionService extends Mock implements CloudVisionService {}

void main() {
  late MockImageService mockImageService;
  late MockTextRecognitionService mockTextRecognitionService;
  late MockCloudVisionService mockCloudVisionService;
  late LogoMenuController controller;

  setUpAll(() {
    registerFallbackValue('dummy');
  });

  setUp(() {
    mockImageService = MockImageService();
    mockTextRecognitionService = MockTextRecognitionService();
    mockCloudVisionService = MockCloudVisionService();

    // Default stubs to prevent null return errors
    when(() => mockImageService.pickImageFromCamera()).thenAnswer((_) async => XFile('path/to/image.jpg'));
    when(() => mockTextRecognitionService.extractTextFromImage(any<String>())).thenAnswer((_) async => 'mocked text');
    when(() => mockCloudVisionService.detectLogosWithCloudVision(any<String>(), any<String>())).thenAnswer((_) async => ['Logo1']);

    controller = LogoMenuController(
      imageService: mockImageService,
      textRecognitionService: mockTextRecognitionService,
      cloudVisionService: mockCloudVisionService,
    );
  });

  test('captureImage calls ImageService and returns XFile', () async {
    final mockFile = XFile('path/to/image.jpg');
    when(() => mockImageService.pickImageFromCamera()).thenAnswer((_) async => mockFile);
    final result = await controller.captureImage();
    expect(result, mockFile);
    verify(() => mockImageService.pickImageFromCamera()).called(1);
  });

  test('extractMenuText calls TextRecognitionService and returns text', () async {
    const imagePath = 'path/to/image.jpg';
    const extractedText = 'Menu Item 1\nMenu Item 2';
    when(() => mockTextRecognitionService.extractTextFromImage(imagePath)).thenAnswer((_) async => extractedText);
    final result = await controller.extractMenuText(imagePath);
    expect(result, extractedText);
    verify(() => mockTextRecognitionService.extractTextFromImage(imagePath)).called(1);
  });

  test('detectLogos calls CloudVisionService and returns logo list', () async {
    const imagePath = 'path/to/image.jpg';
    const apiKey = 'test-api-key';
    final logos = ['Logo1', 'Logo2'];
    when(() => mockCloudVisionService.detectLogosWithCloudVision(imagePath, apiKey)).thenAnswer((_) async => logos);
    final result = await controller.detectLogos(imagePath, apiKey);
    expect(result, logos);
    verify(() => mockCloudVisionService.detectLogosWithCloudVision(imagePath, apiKey)).called(1);
  });
} 