import 'package:dio/dio.dart';
import 'package:goldengoose/features/business/data/repositories/business_repository.dart';
import 'package:goldengoose/features/business/domain/entities/business.dart';
import 'package:goldengoose/features/business/domain/repositories/business_repository.dart';
import '../../../../data/datasources/remote/firebase/firebase_data_source.dart';
import 'dart:typed_data';

class BusinessRepositoryImpl extends BusinessRepository implements IBusinessRepository {
  final Dio dio;
  BusinessRepositoryImpl(this.dio, FirebaseDataSource firebaseDataSource)
      : super(firebaseDataSource: firebaseDataSource);

  @override
  Future<List<Business>> getBusinesses() => super.getBusinesses();
  @override
  Future<List<Business>> getBusinessesByCategory(String category) => super.getBusinessesByCategory(category);
  @override
  Future<List<Business>> searchBusinesses(String query) => super.searchBusinesses(query);
  @override
  Future<List<Business>> getNearbyBusinesses(double latitude, double longitude, double radiusInKm) => super.getNearbyBusinesses(latitude, longitude, radiusInKm);
  @override
  Future<List<Business>> getPopularBusinesses() => super.getPopularBusinesses();
  @override
  Future<void> updateBusinessRating(String businessId, double newRating) => super.updateBusinessRating(businessId, newRating);
  @override
  Future<void> uploadBusinessImage(String businessId, Uint8List imageBytes) => super.uploadBusinessImage(businessId, imageBytes);
} 