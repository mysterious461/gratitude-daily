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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // DAILY QUOTE
            const QuoteCard(),

            const SizedBox(height: 24),

            // TODAY SUMMARY
            Text(
              "Today",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            Text(
              "Take a moment to reflect on what you're grateful for.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            // ADD ENTRY BUTTON
            ElevatedButton(
              onPressed: () {
                // Navigation handled by tab switch
              },
              child: const Text("Add today’s gratitude"),
            ),

            const SizedBox(height: 24),

            // STREAK PREVIEW
            Container(
              padding: const EdgeInsets.all(16),
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
