import '../entities/service.dart';

abstract class IServiceRepository {
  Future<void> createService(Service service);
  Future<Service?> getService(String serviceId);
  Future<void> updateService(Service service);
  Future<void> deleteService(String serviceId);
  Future<List<Service>> listServices();
} 