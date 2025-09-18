import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:whatsapp_ui/features/auth/repository/auth_repo.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthController(authRepo: authRepo);
});

class AuthController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  void signInWithPhone(
    String phoneNumber,
    BuildContext context,
  ) async {
    authRepo.signInWithPhone(
      phoneNumber,
      context,
    );
  }

  void verifyOTP({
    required String verificationId,
    required String userOTP,
    required BuildContext context,
  }) {
    authRepo.verifyOTP(
      verificationId: verificationId,
      userOTP: userOTP,
      context: context,
    );
  }
}
