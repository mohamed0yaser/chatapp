import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backGroundColor;
  final Color? textColor;
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.backGroundColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor ?? AppColors.authButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: textColor,
        ),
      ),
    );
  }
}
