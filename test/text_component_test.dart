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
          home: Scaffold(body: TextComponent(text: testText)),
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
              child: TextComponent(text: testText, overflow: overflowBehavior),
            ),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<Text>(find.textContaining('This'));
      expect(textWidget.overflow, overflowBehavior);
    });

    testWidgets('truncates text with maxLength and shows ellipsis', (
      WidgetTester tester,
    ) async {
      // Arrange
      const testText = 'This text is longer than ten characters';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextComponent(text: testText, maxLength: 10),
          ),
        ),
      );

      // Assert
      expect(find.text('This text ...'), findsOneWidget);
    });

    testWidgets('truncates text with maxLength without ellipsis', (
      WidgetTester tester,
    ) async {
      // Arrange
      const testText = 'This text is longer than ten characters';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextComponent(
              text: testText,
              maxLength: 10,
              showEllipsis: false,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('This text '), findsOneWidget);
    });
  });

  group('Optimised text feature', () {
    testWidgets('uses optimised text when enabled', (
      WidgetTester tester,
    ) async {
      // Arrange
      const testText = 'Optimised text wrapping example';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              child: TextComponent(text: testText, optimisedText: true),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(testText), findsOneWidget);
      expect(find.byType(Align), findsOneWidget);
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('wraps multi-line text at a balanced width', (
      WidgetTester tester,
    ) async {
      // Arrange
      const testText = 'This sentence is long enough to wrap onto two lines';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300,
              child: TextComponent(text: testText, optimisedText: true),
            ),
          ),
        ),
      );

      // Assert: the text box is narrower than the available width, so the
      // lines are balanced instead of leaving a short last line.
      final SizedBox sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(Align),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, lessThan(300.0));
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('uses the provided fixed width instead of LayoutBuilder', (
      WidgetTester tester,
    ) async {
      // Arrange
      const testText = 'Fixed width optimised text';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextComponent(
              text: testText,
              optimisedText: true,
              width: 150,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(LayoutBuilder), findsNothing);
      final SizedBox sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(Align),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, lessThanOrEqualTo(150.0));
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('defaults textAlign to center', (WidgetTester tester) async {
      // Arrange
      const testText = 'Centered optimised text';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              child: TextComponent(text: testText, optimisedText: true),
            ),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('applies maxLength truncation before optimising', (
      WidgetTester tester,
    ) async {
      // Arrange
      const testText = 'This text is longer than ten characters';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              child: TextComponent(
                text: testText,
                optimisedText: true,
                maxLength: 10,
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('This text ...'), findsOneWidget);
    });

    testWidgets('optimised text does not make overflowing single-line text invisible', (
      WidgetTester tester,
    ) async {
      // Arrange
      const testText =
          'You have pushed the button this many times: You have pushed the button this many times';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              child: TextComponent(
                text: testText,
                optimisedText: true,
                maxLines: 1,
              ),
            ),
          ),
        ),
      );

      // Assert
      final SizedBox sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(Align),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, equals(100.0));
    });
  });
}
