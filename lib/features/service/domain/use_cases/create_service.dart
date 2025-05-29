import '../entities/service.dart';
import '../repositories/service_repository.dart';

class CreateService {
  final IServiceRepository repository;
  CreateService(this.repository);

  Future<void> call(Service service) async {
    await repository.createService(service);
  }
} 