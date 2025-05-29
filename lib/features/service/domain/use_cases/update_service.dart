import '../entities/service.dart';
import '../repositories/service_repository.dart';

class UpdateService {
  final IServiceRepository repository;
  UpdateService(this.repository);

  Future<void> call(Service service) async {
    await repository.updateService(service);
  }
} 