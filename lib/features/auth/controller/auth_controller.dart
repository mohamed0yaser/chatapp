import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:whatsapp_ui/features/auth/repository/auth_repo.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthController(authRepo: authRepo);
});

class AuthController extends StateNotifier<AuthState> {
  final AuthRepo authRepo;
  AuthController({required this.authRepo}) : super(const AuthState.initial());

  void signInWithPhone(String phoneNumber, BuildContext context) async {
    state = const AuthState.loading();
    authRepo.signInWithPhone(phoneNumber, context);
  }
}

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final String? verificationId;
  final bool isVerified;

  const AuthState._({
    this.isLoading = false,
    this.errorMessage,
    this.verificationId,
    this.isVerified = false,
  });

  const AuthState.initial() : this._();

  const AuthState.loading() : this._(isLoading: true);

  const AuthState.error(String message)
      : this._(errorMessage: message, isLoading: false);

  const AuthState.codeSent(String verificationId)
      : this._(verificationId: verificationId, isLoading: false);

  const AuthState.verified() : this._(isVerified: true, isLoading: false);
}
