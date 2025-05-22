import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageFromCamera() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }
} 