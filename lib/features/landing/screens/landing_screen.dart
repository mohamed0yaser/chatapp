import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome to Our Chat App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: size.height / 9,
              ),
              Image.asset(
                "assets/bg.png",
                height: 340,
                width: 340,
                color: tabColor,
              ),
              SizedBox(
                height: size.height / 9,
              ),
              const Text(
                'By continuing, you agree to our \n Terms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: size.height / 120,
              ),
              SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                  text: 'AGREE AND CONTINUE',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
