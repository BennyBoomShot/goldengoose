import '../repositories/business_repository.dart';

class UpdateBusinessRating {
  final IBusinessRepository repository;
  UpdateBusinessRating(this.repository);

  Future<void> call(String businessId, double newRating) {
    return repository.updateBusinessRating(businessId, newRating);
  }
} 