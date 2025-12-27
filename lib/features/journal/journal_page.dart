
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
                ElevatedButton(onPressed: () {}, child: const Text('Save Entry')),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _field(String hint) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      ),
    );
  }
}
