import 'dart:typed_data';

import '../entities/business.dart';

abstract class IBusinessRepository {
  Future<List<Business>> getBusinesses();
  Future<List<Business>> getBusinessesByCategory(String category);
  Future<List<Business>> searchBusinesses(String query);
  Future<List<Business>> getNearbyBusinesses(double latitude, double longitude, double radiusInKm);
  Future<List<Business>> getPopularBusinesses();
  Future<void> updateBusinessRating(String businessId, double newRating);
  Future<void> uploadBusinessImage(String businessId, Uint8List imageBytes);
} 