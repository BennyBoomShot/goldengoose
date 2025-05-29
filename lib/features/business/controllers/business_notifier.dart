import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/app_exception.dart';
import '../../../shared/models/async_state.dart';
import '../data/repositories/business_repository.dart';
import '../domain/entities/business.dart';

class BusinessNotifier extends StateNotifier<AsyncState<List<Business>>> {
  final BusinessRepository repository;
  BusinessNotifier(this.repository) : super(const AsyncState.loading());

  Future<void> fetchBusinesses() async {
    try {
      final businesses = await repository.getPopularBusinesses();
      state = AsyncState.data(businesses);
    } on AppException catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
} 