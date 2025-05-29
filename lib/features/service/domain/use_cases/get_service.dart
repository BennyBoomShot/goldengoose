import '../entities/service.dart';
import '../repositories/service_repository.dart';

class GetService {
  final IServiceRepository repository;
  GetService(this.repository);

  Future<Service?> call(String serviceId) async {
    return await repository.getService(serviceId);
  }
} 