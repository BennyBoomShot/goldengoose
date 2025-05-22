import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/features/business/domain/entities/business.dart';
import 'package:goldengoose/features/business/data/repositories/business_repository.dart';
import 'package:goldengoose/shared/models/async_state.dart';
import 'package:goldengoose/core/error/app_exception.dart';

class BusinessNotifier extends StateNotifier<AsyncState<List<Business>>> {
  final BusinessRepository repository;
  BusinessNotifier(this.repository) : super(const AsyncState.loading());

  Future<void> fetchBusinesses() async {
    try {
      final businesses = await repository.getPopularBusinesses();
      state = AsyncState.data(businesses);
    } on AppException catch (e) {
      state = AsyncState.error(e.message ?? 'Unknown error');
    } catch (e) {
      state = AsyncState.error(e.toString());
    }
  }
} 