import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? elevation;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Widget? leading;
  final Color? backgroundColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.elevation,
    this.actions,
    this.centerTitle,
    this.leading,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title, style: const TextStyle(color: AppColors.primary)),
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

