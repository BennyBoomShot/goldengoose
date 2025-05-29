import 'package:dio/dio.dart';

import '../../../../data/datasources/remote/firebase/firebase_data_source.dart';
import '../../domain/repositories/business_repository.dart';
import 'business_repository.dart';

class BusinessRepositoryImpl extends BusinessRepository implements IBusinessRepository {
  final Dio dio;
  BusinessRepositoryImpl(this.dio, FirebaseDataSource firebaseDataSource)
      : super(firebaseDataSource: firebaseDataSource);

} 