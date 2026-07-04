import 'package:flutter/material.dart';

import 'optimised_text_for_width.dart';

/// A widget that wraps text optimally.
final class OptimisedText extends StatelessWidget {
  /// Provide the width for edge cases where LayoutBuilder cannot be used.
  /// Such as inside SliverFillRemaining
  final double? width;

  /// See equivalent property in [Text]
  final String text;

  /// See equivalent property in [Text]
  final TextStyle? style;

  /// See equivalent property in [Text]
  final StrutStyle? strutStyle;

  /// See equivalent property in [Text]
  final TextAlign? textAlign;

  /// See equivalent property in [Text]
  final TextDirection? textDirection;

  /// See equivalent property in [Text]
  final Locale? locale;

  /// See equivalent property in [Text]
  final bool? softWrap;

  /// See equivalent property in [Text]
  final TextScaler? textScaler;

  /// See equivalent property in [Text]
  final String? semanticsLabel;

  /// See equivalent property in [Text]
  final TextWidthBasis? textWidthBasis;

  /// See equivalent property in [Text]
  final TextHeightBehavior? textHeightBehavior;

  /// See equivalent property in [Text]
  final Color? selectionColor;

  /// See equivalent property in [Text]
  final int? maxLines;

  /// See equivalent property in [Text]
  final TextOverflow? overflow;

  /// Creates a widget that wraps text optimally.
  const OptimisedText(
    this.text, {
    super.key,
    this.width,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaler,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return OptimisedTextForWidth(
        text,
        width: width!,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return OptimisedTextForWidth(
          text,
          width: constraints.maxWidth,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          textScaler: textScaler,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
          maxLines: maxLines,
          overflow: overflow,
        );
      },
    );
  }
}
