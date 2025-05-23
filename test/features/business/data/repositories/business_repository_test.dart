import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:goldengoose/features/business/data/repositories/business_repository_impl.dart';
import 'package:goldengoose/core/error/app_exception.dart';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@GenerateMocks([
  Dio,
  FirebaseFirestore,
  CollectionReference<Map<String, dynamic>>,
  Query<Map<String, dynamic>>,
  QuerySnapshot<Map<String, dynamic>>,
])
import 'business_repository_test.mocks.dart';

// Add a fake FirebaseDataSource for testing
class FakeFirebaseDataSource implements FirebaseDataSource {
  final FirebaseFirestore firestoreInstance;
  FakeFirebaseDataSource(this.firestoreInstance);

  @override
  FirebaseFirestore get firestore => firestoreInstance;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Minimal fake Firestore to satisfy the test
class _FakeFirestore {
  dynamic collection([_]) => _FakeCollection();
}
class _FakeCollection {
  dynamic doc([_]) => _FakeDoc();
  dynamic where([a, b, c]) => this;
  dynamic orderBy([a, b]) => this;
  dynamic get() => _FakeQuerySnapshot();
}
class _FakeDoc {
  bool get exists => false;
  dynamic get data => () => <String, dynamic>{};
  dynamic get() => this;
  dynamic update([_]) {}
  dynamic delete() {}
}
class _FakeQuerySnapshot {
  List<dynamic> get docs => [];
}

void main() {
  group('BusinessRepositoryImpl', () {
    late MockDio mockDio;
    late BusinessRepositoryImpl repository;
    late FakeFirebaseDataSource fakeFirebaseDataSource;
    late MockFirebaseFirestore mockFirestore;
    late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
    late MockQuery<Map<String, dynamic>> mockQuery;
    late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;

    setUp(() {
      mockDio = MockDio();
      mockFirestore = MockFirebaseFirestore();
      fakeFirebaseDataSource = FakeFirebaseDataSource(mockFirestore);
      repository = BusinessRepositoryImpl(mockDio, fakeFirebaseDataSource);
      mockCollectionReference = MockCollectionReference<Map<String, dynamic>>();
      mockQuery = MockQuery<Map<String, dynamic>>();
      mockQuerySnapshot = MockQuerySnapshot<Map<String, dynamic>>();

      when(mockFirestore.collection(any)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.orderBy(any, descending: anyNamed('descending'))).thenReturn(mockQuery);
      when(mockQuery.limit(any)).thenReturn(mockQuery);
      when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([]);
      when(mockQuery.get()).thenThrow(Exception('Firestore failure'));
    });

    test('throws AppException.unknown on Firestore failure', () async {
      when(mockQuery.get()).thenThrow(Exception('Firestore failure'));
      expect(
        () async => await repository.getBusinesses(),
        throwsA(isA<AppException>().having((e) => e, 'type', isA<UnknownException>())),
      );
    });
  });
} 