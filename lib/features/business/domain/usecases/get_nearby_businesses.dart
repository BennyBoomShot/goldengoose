import '../entities/business.dart';
import '../repositories/business_repository.dart';

class GetNearbyBusinesses {
  final IBusinessRepository repository;
  GetNearbyBusinesses(this.repository);

  Future<List<Business>> call(double latitude, double longitude, double radiusInKm) {
    return repository.getNearbyBusinesses(latitude, longitude, radiusInKm);
  }
} 