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
      body: const SingleChildScrollView(
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
            SizedBox(height: 12),
            // Optimised text wrapping: multi-line text wraps at a balanced
            // width instead of leaving a short last line.
            TextComponent(
              text:
                  'Optimised wrapping keeps multi-line text balanced instead of leaving one short word on the last line.',
              optimisedText: true,
              maxLines: 3,
            ),
            SizedBox(height: 12),
            // Optimised wrapping with a fixed width, for places where
            // LayoutBuilder cannot measure (e.g. inside SliverFillRemaining).
            TextComponent(
              text: 'Optimised wrapping with a fixed width of 250 pixels.',
              optimisedText: true,
              width: 250,
              maxLines: 2,
            ),
            SizedBox(height: 12),
            // maxLength truncates by character count; showEllipsis controls
            // the trailing "..." (enabled by default).
            TextComponent(
              text: 'This text is limited to twenty characters by maxLength.',
              maxLength: 20,
            ),
            SizedBox(height: 12),
            TextComponent(
              text: 'This text is limited to twenty characters, no ellipsis.',
              maxLength: 20,
              showEllipsis: false,
            ),
          ],
        ),
      ),
    );
  }
}
