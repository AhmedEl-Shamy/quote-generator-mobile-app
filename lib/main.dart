import 'package:flutter/material.dart';

import 'features/home/presentation/pages/home_page.dart';

void main(List<String> args) {
  runApp(const QuoteGeneratorApp());
}

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quote Generator',

      home: HomePage(),
    );
  }
}

