import '../entities/business.dart';
import '../repositories/business_repository.dart';

class GetPopularBusinesses {
  final IBusinessRepository repository;
  GetPopularBusinesses(this.repository);

  Future<List<Business>> call() {
    return repository.getPopularBusinesses();
  }
} 