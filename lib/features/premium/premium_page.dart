import 'package:flutter/material.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Go Premium"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // HEADER
          const Icon(
            Icons.star,
            size: 64,
            color: Colors.amber,
          ),
          const SizedBox(height: 16),
          const Text(
            "A calmer, more personal gratitude experience",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Upgrade to Premium to unlock thoughtful features designed for long-term habit building.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 32),

          // FEATURES
          _FeatureItem(
            icon: Icons.block,
            title: "Ad-free journaling",
            subtitle: "Reflect without distractions",
          ),
          _FeatureItem(
            icon: Icons.lock_outline,
            title: "PIN lock",
            subtitle: "Keep your journal private",
          ),
          _FeatureItem(
            icon: Icons.palette_outlined,
            title: "Extra calming themes",
            subtitle: "Personalize your experience",
          ),
          _FeatureItem(
            icon: Icons.format_quote,
            title: "Inspirational quotes",
            subtitle: "Daily motivation and positivity",
          ),
          _FeatureItem(
            icon: Icons.favorite_outline,
            title: "Support independent development",
            subtitle: "Help keep Gratitude Daily growing",
          ),

          const SizedBox(height: 32),

          // PRICING CARD
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "Premium Access",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "\$2.99 • One-time purchase",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "No subscriptions. Pay once, enjoy forever.",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // CTA BUTTON
          ElevatedButton(
            onPressed: () {
              // IAP flow will be connected later
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              "Unlock Premium",
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 12),

          // FOOTNOTE
          const Text(
            "Premium is optional. Core journaling features are always free.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------- Feature Row Widget ---------- */

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
