import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/cloud_vision_service.dart';

final cloudVisionServiceProvider = Provider<CloudVisionService>((ref) => CloudVisionService()); 