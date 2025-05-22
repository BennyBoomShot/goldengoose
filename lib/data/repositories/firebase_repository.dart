import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:meta/meta.dart';
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

  // Auth Methods
  Future<auth.User?> getCurrentUser() async {
    return firebaseDataSource.auth.currentUser;
  }

  Future<auth.UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await firebaseDataSource.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      throw AppException.unauthorized(e.message ?? 'Authentication failed');
    }
  }

  Future<auth.UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await firebaseDataSource.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      throw AppException.unauthorized(e.message ?? 'User creation failed');
    }
  }

  Future<void> signOut() async {
    await firebaseDataSource.auth.signOut();
  }

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
      throw AppException.unknown('Failed to get document: $e');
    }
  }

  @override
  Future<List<T>> getAll() async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw AppException.unknown('Failed to get documents: $e');
    }
  }

  @override
  Future<void> create(T item) async {
    try {
      final data = toJson(item);
      await firebaseDataSource.firestore
          .collection(collection)
          .add(data);
    } catch (e) {
      throw AppException.unknown('Failed to create document: $e');
    }
  }

  @override
  Future<void> update(T item) async {
    try {
      final data = toJson(item);
      final id = (data['id'] as String?) ?? '';
      if (id.isEmpty) throw AppException.invalidInput('Document ID is required');
      
      await firebaseDataSource.firestore
          .collection(collection)
          .doc(id)
          .update(data);
    } catch (e) {
      throw AppException.unknown('Failed to update document: $e');
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
      throw AppException.unknown('Failed to delete document: $e');
    }
  }

  // Storage Methods
  Future<String> uploadFile(String path, Uint8List bytes) async {
    try {
      final ref = firebaseDataSource.storage.ref().child(path);
      await ref.putData(bytes);
      return await ref.getDownloadURL();
    } catch (e) {
      throw AppException.unknown('Failed to upload file: $e');
    }
  }

  Future<void> deleteFile(String path) async {
    try {
      await firebaseDataSource.storage.ref().child(path).delete();
    } catch (e) {
      throw AppException.unknown('Failed to delete file: $e');
    }
  }
} 