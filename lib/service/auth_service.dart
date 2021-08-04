import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  const AuthService(this._auth);
  final FirebaseAuth _auth;
  User? get firebaseUser => _auth.currentUser;
  String? get firebaseUID => _auth.currentUser?.uid;
  Stream<User?> get isAuthStateChanged => _auth.authStateChanges();
  Future<UserCredential> signUpAnonymously() => _auth.signInAnonymously();
  Future<void> deleteUser(User? user) => user!.delete();
}
