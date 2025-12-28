import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/app_settings.dart';

import 'features/home/home_page.dart';
import 'features/journal/journal_page.dart';
import 'features/calendar/calendar_page.dart';
import 'features/settings/settings_page.dart';

class GratitudeApp extends StatefulWidget {
  const GratitudeApp({super.key});

  @override
  State<GratitudeApp> createState() => _GratitudeAppState();
}

class _GratitudeAppState extends State<GratitudeApp> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        onAddGratitude: () {
          setState(() {
            _currentIndex = 1;
          });
        },
      ),
      const JournalPage(),
      const CalendarPage(streak: 5),
      const SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppSettings.themeMode,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Gratitude Daily',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: _pages[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.edit),
                  label: 'Journal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Streak',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
