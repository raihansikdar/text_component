import 'package:flutter/material.dart';

/// A customizable text widget that wraps the [Text] widget
/// with extended configuration options for reusability and consistency.
///
/// This component allows extensive control over the text styling
/// and behavior, making it ideal for use across large Flutter projects.
class TextComponent extends StatelessWidget {
  /// Creates a [TextComponent].
  ///
  /// The [text] parameter is required and is the string to display.
  const TextComponent({
    super.key,
    required this.text,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.strutStyle,
    this.textDirection,
    this.softWrap,
    this.locale,
    this.textScalar,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.leadingDistribution,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    this.fontFamily,
    this.fontFamilyFallback,
    this.package,
  });

  /// The text content to display.
  final String text;

  /// The maximum number of lines for the text to span.
  final int? maxLines;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The strut style to use for aligning text.
  final StrutStyle? strutStyle;

  /// The text direction for rendering.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// The locale used to select region-specific glyphs.
  final Locale? locale;

  /// The text scaling factor (e.g., for accessibility).
  final TextScaler? textScalar;

  /// The semantics label used for screen readers.
  final String? semanticsLabel;

  /// The width basis to use when measuring the text.
  final TextWidthBasis? textWidthBasis;

  /// Defines how tall the text spans should be.
  final TextHeightBehavior? textHeightBehavior;

  /// Color to paint the selection.
  final Color? selectionColor;

  /// The primary color of the text.
  final Color? color;

  /// The background color of the text.
  final Color? backgroundColor;

  /// The size of the font in logical pixels.
  final double? fontSize;

  /// The thickness of the glyphs used to draw the text.
  final FontWeight? fontWeight;

  /// The typeface variant to use (e.g., italic).
  final FontStyle? fontStyle;

  /// The amount of space between each letter.
  final double? letterSpacing;

  /// The amount of space between each word.
  final double? wordSpacing;

  /// The baseline to use for aligning text.
  final TextBaseline? textBaseline;

  /// The height of this text span, as a multiple of font size.
  final double? height;

  /// Defines how to distribute the leading (e.g., between lines).
  final TextLeadingDistribution? leadingDistribution;

  /// Paint to use as a foreground for the text.
  final Paint? foreground;

  /// Paint to use as a background for the text.
  final Paint? background;

  /// A list of shadows that will be painted underneath the text.
  final List<Shadow>? shadows;

  /// Additional font features to apply to the text.
  final List<FontFeature>? fontFeatures;

  /// Font variation settings (e.g., weight, width).
  final List<FontVariation>? fontVariations;

  /// Decoration to paint above the text (e.g., underline).
  final TextDecoration? decoration;

  /// The color of the decoration line.
  final Color? decorationColor;

  /// The style of the text decoration (solid, dashed, etc.).
  final TextDecorationStyle? decorationStyle;

  /// The thickness of the decoration line.
  final double? decorationThickness;

  /// A label used for debugging text styles.
  final String? debugLabel;

  /// The name of the font family to use.
  final String? fontFamily;

  /// Fallback font families to use when the primary is unavailable.
  final List<String>? fontFamilyFallback;

  /// The name of the package where the font is defined.
  final String? package;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      strutStyle: strutStyle,
      textDirection: textDirection,
      softWrap: softWrap,
      locale: locale,
      textScaler: textScalar,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
      style: TextStyle(
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height,
        leadingDistribution: leadingDistribution,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        fontVariations: fontVariations,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
      ),
    );
  }
}
