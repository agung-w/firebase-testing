import 'package:firebase_testing/login_use_case.dart';
import 'package:firebase_testing/user_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              LoginUseCase(userRepository: UserRepository())
                  .execute("email", "password");
            },
            child: null,
          ),
        ),
      ),
    );
  }
}
