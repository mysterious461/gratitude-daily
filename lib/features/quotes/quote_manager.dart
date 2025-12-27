
import 'dart:convert';
import 'package:flutter/services.dart';

class QuoteManager {
  static Future<String> getQuote() async {
    final data = await rootBundle.loadString('assets/quotes/quotes.json');
    final List quotes = jsonDecode(data);
    return quotes[DateTime.now().day % quotes.length];
  }
}
