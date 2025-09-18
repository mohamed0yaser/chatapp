import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:whatsapp_ui/common/theme/app_colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_app_bar.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const routeName = '/otp-screen';
  final String? verificationId;
  const OTPScreen({Key? key, this.verificationId}) : super(key: key);
  void verifyOTP(WidgetRef ref, BuildContext context, String otp) {
    if (otp.isNotEmpty) {
      ref.read(authControllerProvider).verifyOTP(
            verificationId: verificationId!,
            userOTP: otp,
            context: context,
          );
    }
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    

    return Scaffold(
      appBar: CustomAppBar(
        title: 'OTP Verification',
        backgroundColor: AppColors.authBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            const SizedBox(height: 50),
            const Text('Enter the OTP sent to your phone'),
            // Add your OTP input fields and verification logic here
            const SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: OTPTextField(
                length: 6,
                fieldWidth: 40,
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  verifyOTP(ref, context, pin);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
