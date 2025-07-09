import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Home', style: TextStyle(fontSize: 24)),
        SizedBox(height: 8),
        Text('Welcome to the Home page!'),
      ],
    );
  }
}
