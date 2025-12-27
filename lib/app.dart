
import 'package:flutter/material.dart';
import 'features/journal/journal_page.dart';
import 'core/theme/app_theme.dart';

class GratitudeApp extends StatelessWidget {
  const GratitudeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gratitude Daily',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const JournalPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
