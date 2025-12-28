import 'package:flutter/material.dart';
import 'app.dart';
import 'features/premium/premium_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PremiumManager.init();
  runApp(const GratitudeApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Gratitude Daily'),
        ),
      ),
    );
  }
}
