import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../../../../data/repositories/firebase_repository.dart';
import '../../domain/entities/service.dart';

class ServiceRepository extends FirebaseRepository<Service> {
  ServiceRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'services',
          fromJson: (json) => Service.fromJson(json),
          toJson: (service) => service.toJson(),
        );

  Future<List<Service>> getBusinessServices(String businessId) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('businessId', isEqualTo: businessId)
          .orderBy('name')
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      AppLogger.error('Service error', e, StackTrace.current);
      throw AppException.unknown('Failed to get business services: $e');
    }
  }

  Future<List<Service>> getServicesByCategory(String category) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('category', isEqualTo: category)
          .orderBy('name')
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      AppLogger.error('Service error', e, StackTrace.current);
      throw AppException.unknown('Failed to get services by category: $e');
    }
  }

  Future<List<Service>> searchServices(String query) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      AppLogger.error('Service error', e, StackTrace.current);
      throw AppException.unknown('Failed to search services: $e');
    }
  }

  Future<void> updateServiceAvailability(
    String serviceId,
    bool isAvailable,
  ) async {
    try {
      final service = await get(serviceId);
      if (service == null) {
        throw AppException.notFound('Service not found');
      }

      final updatedService = Service(
        id: service.id,
        businessId: service.businessId,
        name: service.name,
        description: service.description,
        price: service.price,
        durationMinutes: service.durationMinutes,
        imageUrl: service.imageUrl,
        isActive: isAvailable,
        createdAt: service.createdAt,
        updatedAt: DateTime.now(),
      );

      await update(updatedService);
    } catch (e) {
      AppLogger.error('Service error', e, StackTrace.current);
      throw AppException.unknown('Failed to update service availability: $e');
    }
  }

  Future<List<Service>> getPopularServices() async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .orderBy('bookingCount', descending: true)
          .limit(10)
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      AppLogger.error('Service error', e, StackTrace.current);
      throw AppException.unknown('Failed to get popular services: $e');
    }
  }
} 