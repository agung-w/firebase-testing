import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/login_use_case.dart';
import 'package:firebase_testing/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserRepository>(), MockSpec<User>()])
void main() async {
  UserRepository mockUserRepository = MockUserRepository();
  User mockUser = MockUser();
  group('Test UserRepository', () {
    test('Tes success', () async {
      when(mockUserRepository.signIn('username@gmail.com', 'password'))
          .thenAnswer((_) async => Future.value(mockUser));
      User? result = await LoginUseCase(userRepository: mockUserRepository)
          .execute("username@gmail.com", "password");
      expect(result, mockUser);
    });
    test('Given email not registered yet', () async {
      when(mockUserRepository.signIn('notfound@gmail.com', 'password'))
          .thenAnswer((_) async => Future.value(null));
      User? result = await LoginUseCase(userRepository: mockUserRepository)
          .execute("notfound@gmail.com", "password");
      expect(result, null);
    });
  });
}
