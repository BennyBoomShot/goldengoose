import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../presentation/providers/booking_providers.dart' show firebaseDataSourceProvider;
import '../../data/repositories/service_repository.dart';

final serviceRepositoryProvider = Provider<ServiceRepository>((ref) {
  final firebaseDataSource = ref.watch(firebaseDataSourceProvider);
  return ServiceRepository(firebaseDataSource: firebaseDataSource);
}); 