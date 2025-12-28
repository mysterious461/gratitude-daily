import 'package:flutter/material.dart';
import '../../widgets/quote_card.dart';

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
          const QuoteCard(
            quote: "Gratitude turns what we have into enough.",
          ),
          const SizedBox(height: 24),

          Text(
            "Today",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),

          Text(
            "Take a quiet moment to reflect on what you're grateful for today.",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(height: 1.5),
          ),

          const SizedBox(height: 24),

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

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "🔥 Current streak: 5 days\n\nConsistency matters more than perfection.",
              style: TextStyle(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
