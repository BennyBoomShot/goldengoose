import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/error/app_exception.dart';
import '../base_remote_data_source.dart';

class GoogleDataSource implements BaseRemoteDataSource {
  late final GoogleSignIn _googleSignIn;

  GoogleSignIn get googleSignIn => _googleSignIn;

  @override
  Future<void> initialize() async {
    try {
      _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'profile',
        ],
      );
    } catch (e) {
      throw AppException.unknown('Failed to initialize Google Services: $e');
    }
  }

  @override
  Future<void> dispose() async {
    await _googleSignIn.signOut();
  }
} 