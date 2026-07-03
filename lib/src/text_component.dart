import 'package:flutter/material.dart';

import 'optimal_wrapper/optimal_wrap_text.dart';

class TextComponent extends StatelessWidget {
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

    /// NEW
    this.maxLength,
    this.showEllipsis = true,
    this.makeOptimalText = false,
  });

  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final bool? softWrap;
  final Locale? locale;
  final TextScaler? textScalar;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final TextLeadingDistribution? leadingDistribution;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final List<FontVariation>? fontVariations;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final String? debugLabel;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final String? package;

  /// NEW
  final int? maxLength;
  final bool showEllipsis;
  final bool makeOptimalText;

  String get limitedText {
    if (maxLength == null) return text;

    if (text.length <= maxLength!) {
      return text;
    }

    return showEllipsis
        ? '${text.substring(0, maxLength!)}...'
        : text.substring(0, maxLength!);
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w500,
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
    );

    if (makeOptimalText) {
      return OptimalWrapText(
        limitedText,
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
        style: style,
      );
    }

    return Text(
      limitedText,
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

      style: style,
    );
  }
}
