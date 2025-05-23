import 'package:firebase_auth/firebase_auth.dart' as fb;

class FirebaseAuthDataSource {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;

  Future<Map<String, dynamic>?> signIn({required String email, required String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final user = result.user;
    if (user == null) return null;
    return _userToMap(user);
  }

  Future<Map<String, dynamic>?> signUp({required String email, required String password, String? displayName}) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final user = result.user;
    if (user == null) return null;
    if (displayName != null) {
      await user.updateDisplayName(displayName);
    }
    return _userToMap(user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return _userToMap(user);
  }

  Map<String, dynamic> _userToMap(fb.User user) => {
    'id': user.uid,
    'email': user.email,
    'displayName': user.displayName,
    'photoUrl': user.photoURL,
  };
} 