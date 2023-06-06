import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/i_user_repository.dart';

class UserRepository implements IUserRepository {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<User?> get userStream => _auth.authStateChanges();
}
