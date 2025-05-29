import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../../../core/logger/app_logger.dart';
import '../../core/error/app_exception.dart';
import '../../domain/repositories/base_repository.dart';
import '../datasources/remote/firebase/firebase_data_source.dart';

class FirebaseRepository<T> implements BaseRepository<T> {
  @protected
  final FirebaseDataSource firebaseDataSource;
  @protected
  final String collection;
  @protected
  final T Function(Map<String, dynamic>) fromJson;
  @protected
  final Map<String, dynamic> Function(T) toJson;

  FirebaseRepository({
    required this.firebaseDataSource,
    required this.collection,
    required this.fromJson,
    required this.toJson,
  });

  // Firestore Methods
  @override
  Future<T?> get(String id) async {
    try {
      final doc = await firebaseDataSource.firestore
          .collection(collection)
          .doc(id)
          .get();
      if (!doc.exists) return null;
      return fromJson(doc.data()!);
    } catch (e) {
      AppLogger.error('Firestore error', e, StackTrace.current);
      throw AppException.notFound('Failed to get document');
    }
  }

  @override
  Future<List<T>> getAll() async {
    try {
      final querySnapshot =
          await firebaseDataSource.firestore.collection(collection).get();
      return querySnapshot.docs.map((doc) => fromJson(doc.data())).toList();
    } catch (e) {
      AppLogger.error('Firestore error', e, StackTrace.current);
      throw AppException.notFound('Failed to get documents');
    }
  }

  @override
  Future<void> create(T item) async {
    try {
      final data = toJson(item);
      await firebaseDataSource.firestore.collection(collection).add(data);
    } catch (e) {
      AppLogger.error('Firestore error', e, StackTrace.current);
      throw AppException.notFound('Failed to create document');
    }
  }

  @override
  Future<void> update(T item) async {
    try {
      final data = toJson(item);
      final id = (data['id'] as String?) ?? '';
      if (id.isEmpty) {
        AppLogger.error(
            'Firestore error', 'Document ID is required', StackTrace.current);
        throw AppException.invalidInput('Document ID is required');
      }

      await firebaseDataSource.firestore
          .collection(collection)
          .doc(id)
          .update(data);
    } catch (e) {
      AppLogger.error('Firestore error', e, StackTrace.current);
      throw AppException.notFound('Failed to update document');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await firebaseDataSource.firestore
          .collection(collection)
          .doc(id)
          .delete();
    } catch (e) {
      AppLogger.error('Firestore error', e, StackTrace.current);
      throw AppException.notFound('Failed to delete document');
    }
  }

  // Storage Methods
  Future<String> uploadFile(String path, Uint8List bytes) async {
    try {
      final ref = firebaseDataSource.storage.ref().child(path);
      await ref.putData(bytes);
      return await ref.getDownloadURL();
    } catch (e) {
      AppLogger.error('Firestore error', e, StackTrace.current);
      throw AppException.notFound('Failed to upload file');
    }
  }

  Future<void> deleteFile(String path) async {
    try {
      await firebaseDataSource.storage.ref().child(path).delete();
    } catch (e) {
      AppLogger.error('Firestore error', e, StackTrace.current);
      throw AppException.notFound('Failed to delete file');
    }
  }
}
