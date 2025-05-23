import '../entities/business.dart';
import '../repositories/business_repository.dart';

class SearchBusinesses {
  final IBusinessRepository repository;
  SearchBusinesses(this.repository);

  Future<List<Business>> call(String query) {
    return repository.searchBusinesses(query);
  }
} 