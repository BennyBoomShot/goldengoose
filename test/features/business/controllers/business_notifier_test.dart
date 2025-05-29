import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/error/app_exception.dart';
import 'package:goldengoose/features/business/controllers/business_notifier.dart';
import 'package:goldengoose/features/business/data/repositories/business_repository.dart';
import 'package:goldengoose/features/business/domain/entities/business.dart';
import 'package:goldengoose/shared/models/async_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([BusinessRepository])
import 'business_notifier_test.mocks.dart';

void main() {
  group('BusinessNotifier', () {
    late MockBusinessRepository mockRepository;
    late BusinessNotifier notifier;

    setUp(() {
      mockRepository = MockBusinessRepository();
      notifier = BusinessNotifier(mockRepository);
    });

    test('emits data state on success', () async {
      final businesses = [Business(
        id: '1',
        name: 'Test',
        description: 'desc',
        address: 'addr',
        city: 'city',
        state: 'state',
        zipCode: 'zip',
        country: 'country',
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      )];
      when(mockRepository.getPopularBusinesses()).thenAnswer((_) async => businesses);
      await notifier.fetchBusinesses();
      expect(notifier.state, AsyncState.data(businesses));
    });

    test('emits error state on AppException', () async {
      when(mockRepository.getPopularBusinesses()).thenThrow(AppException.networkError('fail'));
      await notifier.fetchBusinesses();
      expect(notifier.state, isA<AsyncState<List<Business>>>());
      expect((notifier.state).maybeWhen(
        error: (msg) => msg,
        orElse: () => null,
      ), contains('fail'));
    });
  });
} 