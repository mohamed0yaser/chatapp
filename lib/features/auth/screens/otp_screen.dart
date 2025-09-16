import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/custom_app_bar.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';

class OTPScreen extends StatelessWidget {
  static const routeName = '/otp-screen';
  final String? verificationId;
  const OTPScreen({Key? key, this.verificationId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'OTP Verification'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Enter the OTP sent to your phone'),
            // Add your OTP input fields and verification logic here
            const SizedBox(height: 16),

            CustomButton(text:  'Verify', onPressed: () {
              // Add your OTP verification logic here
            }),
          ],
        ),
      ),
    );
  }
}