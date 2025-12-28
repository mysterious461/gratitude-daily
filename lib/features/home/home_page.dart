import 'package:flutter/material.dart';
import '../../widgets/quote_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gratitude Daily"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // DAILY QUOTE
            const QuoteCard(),
            const SizedBox(height: 28),

            // TODAY SUMMARY
            Text(
              "Today",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            Text(
              "Take a quiet moment to reflect on what you're grateful for today.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                   height: 1.5,
                   fontWeight: FontWeight.w600,
                 ),
            ),

            const SizedBox(height: 24),

            // ADD ENTRY BUTTON
            ElevatedButton(
              onPressed: () {
            // Later we can auto-switch to Journal tab
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Add today’s gratitude",
                style: TextStyle(fontSize: 16),
              ),
            ),


            const SizedBox(height: 24),

            // STREAK PREVIEW
            const Text(
              "🔥 Current streak: 0 days\n\nConsistency matters more than perfection.",
              style: TextStyle(height: 1.4),
            ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "🔥 Current streak: 0 days\nConsistency matters more than perfection.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
