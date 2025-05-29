import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class ImagePickerNotifier extends StateNotifier<AsyncState<XFile?>> {
  final ImagePicker _picker = ImagePicker();
  ImagePickerNotifier() : super(const AsyncState.data(null));
  Future<void> pickImage() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      state = AsyncState.data(image);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}
final imagePickerProvider = StateNotifierProvider<ImagePickerNotifier, AsyncState<XFile?>>(
  (ref) => ImagePickerNotifier(),
); 