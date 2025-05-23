import '../entities/business.dart';
import '../repositories/business_repository.dart';

class GetBusinessesByCategory {
  final IBusinessRepository repository;
  GetBusinessesByCategory(this.repository);

  Future<List<Business>> call(String category) {
    return repository.getBusinessesByCategory(category);
  }
} 