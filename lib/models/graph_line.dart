import 'package:flutter/material.dart';

import 'package:graph_calculator/models/models.dart';

/// Represents a line that can be drawn on a canvas.
class GraphLine extends DrawableObject {
  final Color color; // The color of the line.
  final Offset startOffset; // The starting point of the line.
  final Offset endOffset; // The ending point of the line.
  final double lineWidth; // The width of the line.

  /// Creates a [GraphLine] with the specified [color], [startOffset], [endOffset], and [lineWidth].
  GraphLine({
    required this.color,
    required this.startOffset,
    required this.endOffset,
    required this.lineWidth,
  });

  /// Draws the line on the given [canvas] with the provided [size].
  @override
  void draw(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.square;
    canvas.drawLine(startOffset, endOffset, paint);
  }
}
