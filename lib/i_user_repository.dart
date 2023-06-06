import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository {
  Stream<User?> get userStream;
  Future<User?> signIn(String username, String password);
}
