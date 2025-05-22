import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

@Skip('ML Kit plugins cannot be tested in unit tests')
class MockTextRecognizer extends Mock {
  Future<MockRecognizedText> processImage(dynamic inputImage) async => MockRecognizedText();
  Future<void> close() async {}
}

class MockRecognizedText {
  String get text => 'Mocked recognized text';
}

void main() {
  // Test skipped
} 