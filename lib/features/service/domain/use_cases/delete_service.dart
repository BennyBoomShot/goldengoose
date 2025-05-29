import '../repositories/service_repository.dart';

class DeleteService {
  final IServiceRepository repository;
  DeleteService(this.repository);

  Future<void> call(String serviceId) async {
    await repository.deleteService(serviceId);
  }
} 