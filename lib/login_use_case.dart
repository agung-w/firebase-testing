import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/user_repository.dart';

class LoginUseCase {
  UserRepository userRepository;
  LoginUseCase({required this.userRepository});
  Future<User?> execute(String email, String password) {
    return userRepository.signIn(email, password);
  }
}
