import 'dart:math' as math;
import 'dart:typed_data';

import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../../../../data/repositories/firebase_repository.dart';
import '../../domain/entities/business.dart';
import '../../domain/repositories/business_repository.dart';

class BusinessRepository extends FirebaseRepository<Business> implements IBusinessRepository {
  BusinessRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'businesses',
          fromJson: (json) => Business.fromJson(json),
          toJson: (business) => business.toJson(),
        );

  @override
  Future<List<Business>> getBusinessesByCategory(String category) async {
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
      AppLogger.error('Business error', e, StackTrace.current);
      throw AppException.notFound('Failed to get businesses by category');
    }
  }

  @override
  Future<List<Business>> searchBusinesses(String query) async {
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
      AppLogger.error('Business error', e, StackTrace.current);
      throw AppException.notFound('Failed to search businesses');
    }
  }

  @override
  Future<List<Business>> getNearbyBusinesses(
    double latitude,
    double longitude,
    double radiusInKm,
  ) async {
    try {
      // Note: This is a simplified version. For production, you should use
      // GeoFirestore or a similar solution for proper geospatial queries
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('isActive', isEqualTo: true)
          .get();

      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .where((business) {
            // Since we don't have coordinates in the model, we'll need to parse them from the address
            // This is a simplified version - in production, you should store coordinates separately
            final distance = _calculateDistance(
              latitude,
              longitude,
              0, // TODO: Implement geocoding to get coordinates from address
              0, // TODO: Implement geocoding to get coordinates from address
            );
            return distance <= radiusInKm;
          })
          .toList();
    } catch (e) {
      AppLogger.error('Business error', e, StackTrace.current);
      throw AppException.notFound('Failed to get nearby businesses');
    }
  }

  @override
  Future<List<Business>> getPopularBusinesses() async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .orderBy('rating', descending: true)
          .limit(10)
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      AppLogger.error('Business error', e, StackTrace.current);
      throw AppException.notFound('Failed to get popular businesses');
    }
  }

  @override
  Future<void> updateBusinessRating(
    String businessId,
    double newRating,
  ) async {
    try {
      final business = await get(businessId);
      if (business == null) {
        throw AppException.notFound('Business not found');
      }

      final updatedBusiness = Business(
        id: business.id,
        name: business.name,
        description: business.description,
        address: business.address,
        city: business.city,
        state: business.state,
        zipCode: business.zipCode,
        country: business.country,
        website: business.website,
        phoneNumber: business.phoneNumber,
        email: business.email,
        images: business.images,
        rating: newRating,
        reviewCount: business.reviewCount,
        isActive: business.isActive,
        createdAt: business.createdAt,
        updatedAt: DateTime.now(),
      );

      await update(updatedBusiness);
    } catch (e) {
      AppLogger.error('Business error', e, StackTrace.current);
      throw AppException.notFound('Failed to update business rating');
    }
  }

  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const R = 6371.0; // Earth's radius in kilometers
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.asin(math.sqrt(a));
    return R * c;
  }

  double _toRadians(double degree) {
    return degree * (math.pi / 180);
  }

  @override
  Future<void> uploadBusinessImage(String businessId, Uint8List imageBytes) async {
    final path = 'businesses/$businessId/images/${DateTime.now().millisecondsSinceEpoch}';
    final imageUrl = await uploadFile(path, imageBytes);
    
    final business = await get(businessId);
    if (business != null) {
      final updatedImages = [...(business.images ?? []), imageUrl].cast<String>();
      final updatedBusiness = Business(
        id: business.id,
        name: business.name,
        description: business.description,
        address: business.address,
        city: business.city,
        state: business.state,
        zipCode: business.zipCode,
        country: business.country,
        website: business.website,
        phoneNumber: business.phoneNumber,
        email: business.email,
        images: updatedImages,
        rating: business.rating,
        reviewCount: business.reviewCount,
        isActive: business.isActive,
        createdAt: business.createdAt,
        updatedAt: DateTime.now(),
      );
      await update(updatedBusiness);
    }
  }

  @override
  Future<List<Business>> getBusinesses() async {
    return getPopularBusinesses();
  }
} 