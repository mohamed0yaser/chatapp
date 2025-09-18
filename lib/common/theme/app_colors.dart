import 'package:flutter/material.dart';

class AppColors {
  // Base palette (your provided colors)
  static const Color primary = Color(0xFF5e6472);
  static const Color secondary = Color(0xFFaed9e0);
  static const Color surface = Color(0xFFb8f2e6);
  static const Color background = Color(0xFFfaf3dd);
  static const Color accent = Color(0xFFffa69e);

  // Extended palette for app states
  static const Color chatBubbleSent = secondary;
  static const Color chatBubbleReceived = background;
  static const Color chatText = primary;
  static const Color chatTimestamp = Color(0xFF8a8f9c);

  static const Color statusOnline = Color(0xFF4CAF50);
  static const Color statusOffline = Color(0xFF9e9e9e);
  static const Color statusBusy = Color(0xFFFF5722);
  static const Color statusAway = Color(0xFFFFC107);

  static const Color callIncoming = Color(0xFF4CAF50);
  static const Color callOutgoing = secondary;
  static const Color callMissed = accent;

  static const Color authBackground = background;
  static const Color authInput = Colors.white;
  static const Color authButton = primary;
  static const Color authButtonText = Colors.white;

  static const Color lockScreenBackground = primary;
  static const Color lockScreenText = background;

  static const Color navBar = primary;
  static const Color navIcon = background;
  static const Color navActive = accent;

  static const Color notificationBadge = accent;
  static const Color notificationText = Colors.white;

  static const Color systemMessage = Color(0xFF8a8f9c);
  static const Color linkText = Color(0xFF0077b6);
  static const Color highlight = Color(0xFFFFD166);

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE63946);
  static const Color warning = Color(0xFFFFB703);
  static const Color info = Color(0xFF219EBC);
}

