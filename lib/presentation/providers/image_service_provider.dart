import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/core/services/image_service.dart';

final imageServiceProvider = Provider<ImageService>((ref) => ImageService()); 