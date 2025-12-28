import 'package:flutter/material.dart';
import '../../widgets/quote_card.dart';
import '../premium/premium_page.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onAddGratitude;

  const HomePage({
    super.key,
    required this.onAddGratitude,
  });

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
              onPressed: onAddGratitude,
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

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                ),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        "Go Premium",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Unlock extra themes, PIN lock, inspirational quotes, and enjoy an ad-free experience.",
                    style: TextStyle(height: 1.4),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PremiumPage()),
                      );

                      child: const Text("Learn more"),
                    ),
                  ),
                ],
              ),
            ),

            ),
          ],
        ),
      ),
    );
  }
}
