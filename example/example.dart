import 'package:flutter/material.dart';
import 'package:text_component/text_component.dart';

void main() {
  runApp(const MyApp());
}

/// A minimal Flutter app to demonstrate the usage of [TextComponent].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextComponent Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExampleScreen(),
    );
  }
}

/// A sample screen displaying various usages of [TextComponent].
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextComponent Demo')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponent(text: 'Simple Text'),
            SizedBox(height: 12),
            TextComponent(
              text: 'Bold & Larger Text',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 12),
            TextComponent(
              text: 'Custom Colored Text with Italics',
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
            ),
            SizedBox(height: 12),
            TextComponent(
              text: 'Text with Shadow & Underline',
              shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)],
              decoration: TextDecoration.underline,
            ),
            SizedBox(height: 12),
            TextComponent(
              text:
                  'Max 1 line with ellipsis overflow. This is too long to fit in a single line.',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
