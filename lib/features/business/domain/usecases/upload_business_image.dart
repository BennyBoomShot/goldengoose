import 'dart:typed_data';
import '../repositories/business_repository.dart';

class UploadBusinessImage {
  final IBusinessRepository repository;
  UploadBusinessImage(this.repository);

  Future<void> call(String businessId, Uint8List imageBytes) {
    return repository.uploadBusinessImage(businessId, imageBytes);
  }
} 