import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/home/home_page.dart';
import 'features/journal/journal_page.dart';
import 'features/calendar/calendar_page.dart';

class GratitudeApp extends StatefulWidget {
  const GratitudeApp({super.key});

  @override
  State<GratitudeApp> createState() => _GratitudeAppState();
}

class _GratitudeAppState extends State<GratitudeApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    JournalPage(),
    CalendarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gratitude Daily',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
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
              label: 'Calendar',
            ),
          ],
        ),
      ),
    );
  }
}
