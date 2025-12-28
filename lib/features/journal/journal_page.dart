
import 'package:flutter/material.dart';
import '../calendar/calendar_page.dart';
import '../quotes/quote_manager.dart';
import '../../widgets/quote_card.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gratitude Daily'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CalendarPage(streak: 5)));
            },
          )
        ],
      ),
      body: FutureBuilder<String>(
        future: QuoteManager.getQuote(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (snapshot.hasData) QuoteCard(quote: snapshot.data!),
                const SizedBox(height: 16),
                _field('Something that made me smile'),
                _field('Someone I am grateful for'),
                _field('A small win today'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save today’s gratitude',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _field(String hint) {
    return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: TextField(
                maxLines: null,
                minLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  border: InputBorder.none,
                ),
              ),

      ),
    );
  }
}
