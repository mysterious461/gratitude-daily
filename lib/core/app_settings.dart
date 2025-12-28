import 'package:flutter/material.dart';

class AppSettings {
  // Theme mode (light / dark)
  static final ValueNotifier<ThemeMode> themeMode =
      ValueNotifier(ThemeMode.system);

  // Reminder toggle (placeholder)
  static final ValueNotifier<bool> dailyReminderEnabled =
      ValueNotifier(false);
}
