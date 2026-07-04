import 'package:flutter/painting.dart';

double findOptimisedTextPainterWidth(TextPainter painter) {
  final height = painter.height;

  var left = 0.0;
  var right = painter.width;
  var best = painter.width;

  // binary search to efficiently find the optimal width
  while ((right - left) > 1) {
    final mid = (left + right) / 2;

    painter.layout(maxWidth: mid);

    // didExceedMaxLines guards painters with maxLines: their height stays
    // clamped while text gets cut off, which would fool the height check.
    if (painter.height <= height && !painter.didExceedMaxLines) {
      best = mid;
      right = mid;
    } else {
      left = mid;
    }
  }

  return best;
}
