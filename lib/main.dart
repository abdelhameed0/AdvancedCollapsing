import 'package:flutter/material.dart';

import 'ac_global_comps/ac_text.dart';
import 'advanced_collapsing/telegram_ex/telegram_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Collapsing App',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AcText(
            title: 'Advanced Collapsing', size: 12, color: Colors.black),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const AcText(title: "Advanced Collapsing types", size: 12),
          const SizedBox(height: 60),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TelegramView()));
            },
            color: Colors.blue,
            child: const AcText(
              title: "telegram",
              size: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
