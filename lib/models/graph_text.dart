import 'package:flutter/material.dart';

import 'package:graph_calculator/models/models.dart';

/// Represents a text element that can be drawn on a canvas.
class GraphText extends DrawableObject {
  final String text; // The text content to be displayed.
  final TextStyle textStyle; // The style of the text, such as color and font.
  final Offset offset; // The position at which the text should be drawn.
  late TextPainter _textPainter; // A TextPainter for rendering the text.

  /// Creates a [GraphText] with the specified [text], [textStyle], and [offset].
  GraphText({
    required this.text,
    this.textStyle = const TextStyle(color: Colors.white),
    required this.offset,
  }) {
    _textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 10, maxWidth: 100);
  }

  /// Draws the text on the given [canvas] with the provided [size].
  @override
  void draw(Canvas canvas, Size size) {
    _textPainter.paint(canvas, offset);
  }
}
