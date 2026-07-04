# TextComponent

`TextComponent` is a Flutter package designed to simplify text customization by extending the capabilities of Flutter's built-in `Text` widget. With full support for rich styling, accessibility, and responsive text scaling, `TextComponent` makes it easier to build beautiful and consistent UI elements for your Flutter apps.

## Features

- **Full Customization**: Supports all essential `TextStyle` properties such as:
    - `color`, `fontSize`, `fontWeight`, `fontStyle`
    - `letterSpacing`, `wordSpacing`, `shadows`, and `decoration`
- **Text Overflow Handling**: Easily manage text overflow with options like `ellipsis`, `fade`, or `clip`.
- **Optimised Text Wrapping**: Enable `optimisedText` to wrap multi-line text at a balanced width, avoiding an awkward short last line.
- **Max Length**: Limit text to a character count with `maxLength`, with an optional trailing ellipsis via `showEllipsis`.
- **Responsive Design**: Built-in `textScalar` support for responsive text scaling.
- **Accessibility**: Includes properties for `locale`, `semanticsLabel`, and `textDirection`.
- **Rich Text Styling**: Supports advanced text styles like `decorationThickness`, `leadingDistribution`, and `fontVariations`.

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  text_component: ^2.0.0

```

## 🧩 Getting Started
Simply import the package in your Dart file:
```
import 'package:text_component/text_component.dart';

```



## Usage
```
import 'package:flutter/material.dart';
import 'package:text_component/text_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TextComponent Example')),
        body: const Center(
          child: TextComponent(
            text: 'Hello, TextComponent!',
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

```

## Applying Custom Styling

```
TextComponent(
  text: 'Stylish Text',
  fontSize: 18,
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.italic,
  letterSpacing: 1.5,
  decoration: TextDecoration.underline,
  color: Colors.red,
);
```
## Managing Text Overflow
```
 TextComponent(
  text: 'This is a long text that might overflow the container.',
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
);
```
## Optimised Text Wrapping

By default, Flutter wraps text greedily, which can leave a short "orphan" word
on the last line:

```text
This sentence is long enough to wrap onto two
lines
```

Set `optimisedText: true` and `TextComponent` measures the text and shrinks the
box to a balanced width, so the lines break evenly:

```text
This sentence is long enough
to wrap onto two lines
```

```
TextComponent(
  text: 'This sentence is long enough to wrap onto two lines',
  optimisedText: true,
);
```

When `optimisedText` is enabled, `textAlign` defaults to `TextAlign.center`.
Pass your own `textAlign` to override it.

In places where the available width cannot be measured with a `LayoutBuilder`
(for example inside `SliverFillRemaining`), provide a fixed `width`:

```
TextComponent(
  text: 'Balanced text inside a sliver',
  optimisedText: true,
  width: 300,
);
```

## Limiting Text Length

Use `maxLength` to cap the number of characters. An ellipsis is appended by
default; set `showEllipsis: false` to truncate silently:

```
TextComponent(
  text: 'This text is longer than ten characters',
  maxLength: 10,            // renders: "This text ..."
);

TextComponent(
  text: 'This text is longer than ten characters',
  maxLength: 10,
  showEllipsis: false,      // renders: "This text "
);
```

## Adding Shadows
```
 TextComponent(
  text: 'Shadowed Text',
  shadows: [
    Shadow(
      offset: Offset(2, 2),
      blurRadius: 4,
      color: Colors.black.withOpacity(0.5),
    ),
  ],
);

```


### Key Improvements:
1. Added a **clear description** of the package.
2. Highlighted key **features** with examples.
3. Provided a **getting started** section to help users integrate the package.
4. Added **code snippets** to demonstrate usage.
5. Included **additional information** about contributions, issues, and licensing.






##  👨‍💻 Author
**Raihan Sikdar**

Website: [raihansikdar.com](https://raihansikdar.com)  
Email: raihansikdar10@gmail.com  
GitHub: [raihansikdar](https://github.com/raihansikdar)  
LinkedIn: [raihansikdar](https://www.linkedin.com/in/raihansikdar/)


## 📜 License
This package is licensed under the [MIT License](https://github.com/raihansikdar/text_component/blob/main/LICENSE).



