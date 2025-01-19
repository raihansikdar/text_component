import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_component/text_component.dart';

void main() {
  group('TextComponent Widget Tests', () {
    testWidgets('renders text correctly', (WidgetTester tester) async {
      // Arrange
      const testText = 'Hello, TextComponent!';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextComponent(text: testText),
          ),
        ),
      );

      // Assert
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('applies text color', (WidgetTester tester) async {
      // Arrange
      const testText = 'Colored Text';
      const testColor = Colors.red;

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextComponent(text: testText, color: testColor),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.color, testColor);
    });

    testWidgets('applies font size', (WidgetTester tester) async {
      // Arrange
      const testText = 'Large Text';
      const testFontSize = 24.0;

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextComponent(text: testText, fontSize: testFontSize),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontSize, testFontSize);
    });

    testWidgets('applies overflow behavior', (WidgetTester tester) async {
      // Arrange
      const testText = 'This is a long text that will overflow';
      const overflowBehavior = TextOverflow.fade;

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              child: TextComponent(
                text: testText,
                overflow: overflowBehavior,
              ),
            ),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<Text>(find.textContaining('This'));
      expect(textWidget.overflow, overflowBehavior);
    });
  });
}
