import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:whatsapp_ui/common/widgets/utils/utils.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/user_info_screen.dart';

final authRepoProvider = Provider((ref) {
  return AuthRepo(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  );
});
class AuthRepo {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRepo({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  void signInWithPhone(String phonenumber, BuildContext context) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushNamed(
            context,
            OTPScreen.routeName,
            arguments: verificationId,
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
          log('Auto-resolution timed out for verificationId: $verificationId');
          showToast(context: context, messege: 'Auto-resolution timed out');
        },
      );
    } on FirebaseAuthException catch (e) {
      showToast(context: context, messege: e.message!);
    }
  }

  void verifyOTP({
    required String verificationId,
    required String userOTP,
    required BuildContext context,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );

      await firebaseAuth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInfoScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showToast(context: context, messege: e.message!);
    }
  }
}
