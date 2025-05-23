import '../entities/business.dart';
import '../repositories/business_repository.dart';

class GetBusinesses {
  final IBusinessRepository repository;
  GetBusinesses(this.repository);

  Future<List<Business>> call() {
    return repository.getBusinesses();
  }
} 