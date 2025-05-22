import 'package:dio/dio.dart';
import 'package:goldengoose/features/business/data/repositories/business_repository.dart';
import 'package:goldengoose/features/business/domain/entities/business.dart';
import '../../../../data/datasources/remote/firebase/firebase_data_source.dart';

class BusinessRepositoryImpl extends BusinessRepository {
  final Dio dio;
  BusinessRepositoryImpl(this.dio, FirebaseDataSource firebaseDataSource)
      : super(firebaseDataSource: firebaseDataSource);

  // Example stub method to satisfy test
  @override
  Future<List<Business>> getBusinesses() async {
    return getPopularBusinesses();
  }
} 