import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../base_remote_data_source.dart';

class FirebaseDataSource implements BaseRemoteDataSource {
  late final FirebaseFirestore _firestore;
  late final FirebaseAuth _auth;
  late final FirebaseStorage _storage;

  FirebaseFirestore get firestore => _firestore;
  FirebaseAuth get auth => _auth;
  FirebaseStorage get storage => _storage;

  @override
  Future<void> initialize() async {
    try {
      await Firebase.initializeApp();
      _firestore = FirebaseFirestore.instance;
      _auth = FirebaseAuth.instance;
      _storage = FirebaseStorage.instance;
    } catch (e) {
      AppLogger.error('Firebase error', e, StackTrace.current);
      throw AppException.serverError('Failed to initialize Firebase');
    }
  }

  @override
  Future<void> dispose() async {
    // Clean up any Firebase resources if needed
  }
} 