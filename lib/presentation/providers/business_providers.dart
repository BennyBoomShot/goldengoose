import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/remote/firebase/firebase_data_source.dart';
import '../../features/business/data/repositories/business_repository.dart';
import '../../features/business/data/repositories/business_repository_impl.dart';
import '../../features/business/domain/usecases/get_businesses.dart';
import '../../features/business/domain/usecases/get_businesses_by_category.dart';
import '../../features/business/domain/usecases/get_nearby_businesses.dart';
import '../../features/business/domain/usecases/get_popular_businesses.dart';
import '../../features/business/domain/usecases/search_businesses.dart';
import '../../features/business/domain/usecases/update_business_rating.dart';
import '../../features/business/domain/usecases/upload_business_image.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) => FirebaseDataSource());

final businessRepositoryProvider = Provider<BusinessRepository>((ref) {
  final firebaseDataSource = ref.read(firebaseDataSourceProvider);
  return BusinessRepository(firebaseDataSource: firebaseDataSource);
});

final businessRepositoryImplProvider = Provider<BusinessRepositoryImpl>((ref) {
  final dio = ref.read(dioProvider);
  final firebaseDataSource = ref.read(firebaseDataSourceProvider);
  return BusinessRepositoryImpl(dio, firebaseDataSource);
});

final getBusinessesProvider = Provider<GetBusinesses>((ref) {
  final repo = ref.read(businessRepositoryProvider);
  return GetBusinesses(repo);
});

final getBusinessesByCategoryProvider = Provider<GetBusinessesByCategory>((ref) {
  final repo = ref.read(businessRepositoryProvider);
  return GetBusinessesByCategory(repo);
});

final searchBusinessesProvider = Provider<SearchBusinesses>((ref) {
  final repo = ref.read(businessRepositoryProvider);
  return SearchBusinesses(repo);
});

final getNearbyBusinessesProvider = Provider<GetNearbyBusinesses>((ref) {
  final repo = ref.read(businessRepositoryProvider);
  return GetNearbyBusinesses(repo);
});

final getPopularBusinessesProvider = Provider<GetPopularBusinesses>((ref) {
  final repo = ref.read(businessRepositoryProvider);
  return GetPopularBusinesses(repo);
});

final updateBusinessRatingProvider = Provider<UpdateBusinessRating>((ref) {
  final repo = ref.read(businessRepositoryProvider);
  return UpdateBusinessRating(repo);
});

final uploadBusinessImageProvider = Provider<UploadBusinessImage>((ref) {
  final repo = ref.read(businessRepositoryProvider);
  return UploadBusinessImage(repo);
}); 