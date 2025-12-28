
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final int streak;
  const CalendarPage({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Streak')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // STREAK CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Current Streak",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "🔥 $streak days",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _streakMessage(streak),
                    style: const TextStyle(
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
      
            const SizedBox(height: 32),
      
            // INFO TEXT
            const Text(
              "Consistency matters more than perfection.\n"
              "Even one grateful thought a day makes a difference.",
              style: TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
      String _streakMessage(int days) {
        if (days >= 30) return "Gratitude is part of your life now ✨";
        if (days >= 7) return "One full week — well done!";
        if (days >= 3) return "You’re building a habit 🌱";
        return "Start small. Stay consistent.";
      }
    );
  }
}
