import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/core/services/text_recognition_service.dart';

final textRecognitionServiceProvider = Provider<TextRecognitionService>((ref) => TextRecognitionService()); 