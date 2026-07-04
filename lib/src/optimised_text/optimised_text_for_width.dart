// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'utils/find_optimised_text_painter_width.dart';
import 'utils/text_align_to_alignment.dart';

final class OptimisedTextForWidth extends StatelessWidget {
  final double width;
  final String text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextScaler? textScaler;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final int? maxLines;
  final TextOverflow? overflow;

  const OptimisedTextForWidth(
    this.text, {
    super.key,
    required this.width,
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
    final defaultStyle = DefaultTextStyle.of(context);
    final effectiveTextAlign =
        textAlign ?? defaultStyle.textAlign ?? TextAlign.start;
    final effectiveTextDirection = textDirection ?? Directionality.of(context);

    final painter = TextPainter(
      text: TextSpan(text: text, style: defaultStyle.style.merge(style)),
      textDirection: textDirection ?? Directionality.of(context),
      textAlign: textAlign ?? defaultStyle.textAlign ?? TextAlign.start,
      strutStyle: strutStyle,
      textScaler: textScaler ?? MediaQuery.textScalerOf(context),
      locale: locale,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior:
          textHeightBehavior ?? DefaultTextHeightBehavior.maybeOf(context),
      maxLines: maxLines,
    )..layout(maxWidth: width);

    // When the text already overflows maxLines at the full width, shrinking
    // further would only cut off more text, so keep the full width.
    final optimisedWidth = painter.didExceedMaxLines
        ? width
        : findOptimisedTextPainterWidth(painter);
    painter.dispose();

    return Align(
      alignment: effectiveTextAlign.toAlignment(effectiveTextDirection),
      child: SizedBox(
        width: optimisedWidth,
        child: Text(
          text,
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
        ),
      ),
    );
  }
}
