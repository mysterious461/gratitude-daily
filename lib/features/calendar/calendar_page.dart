
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final int streak;
  const CalendarPage({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Streak')),
      body: Center(
        child: Text('🔥 $streak Day Streak',
          style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
