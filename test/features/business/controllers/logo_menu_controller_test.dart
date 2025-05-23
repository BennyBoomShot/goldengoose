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

  test('captureAndDetectLogo returns success when image and logos are found', () async {
    const apiKey = 'test-api-key';
    final mockFile = XFile('path/to/image.jpg');
    final mockLogos = ['Logo1', 'Logo2'];
    when(() => mockImageService.pickImageFromCamera()).thenAnswer((_) async => mockFile);
    when(() => mockCloudVisionService.detectLogosWithCloudVision(mockFile.path, apiKey)).thenAnswer((_) async => mockLogos);
    final result = await controller.captureAndDetectLogo(apiKey);
    expect(result.isSuccess, true);
    expect(result.imagePath, mockFile.path);
    expect(result.logos, mockLogos);
  });

  test('captureAndDetectLogo returns failure when no image is captured', () async {
    const apiKey = 'test-api-key';
    when(() => mockImageService.pickImageFromCamera()).thenAnswer((_) async => null);
    final result = await controller.captureAndDetectLogo(apiKey);
    expect(result.isSuccess, false);
    expect(result.error, isNotNull);
  });

  test('captureAndExtractMenuText returns success when image and text are found', () async {
    final mockFile = XFile('path/to/image.jpg');
    const mockText = 'Menu Item 1\nMenu Item 2';
    when(() => mockImageService.pickImageFromCamera()).thenAnswer((_) async => mockFile);
    when(() => mockTextRecognitionService.extractTextFromImage(mockFile.path)).thenAnswer((_) async => mockText);
    final result = await controller.captureAndExtractMenuText();
    expect(result.isSuccess, true);
    expect(result.imagePath, mockFile.path);
    expect(result.text, mockText);
  });

  test('captureAndExtractMenuText returns failure when no image is captured', () async {
    when(() => mockImageService.pickImageFromCamera()).thenAnswer((_) async => null);
    final result = await controller.captureAndExtractMenuText();
    expect(result.isSuccess, false);
    expect(result.error, isNotNull);
  });
} 