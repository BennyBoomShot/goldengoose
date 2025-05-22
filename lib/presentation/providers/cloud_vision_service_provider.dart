import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/core/services/cloud_vision_service.dart';

final cloudVisionServiceProvider = Provider<CloudVisionService>((ref) => CloudVisionService()); 