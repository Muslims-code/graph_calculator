import 'package:flutter/material.dart';

/// An abstract class for drawable objects on a canvas.
abstract class DrawableObject {
  /// Draws the drawable object on the given [canvas] with the provided [size].
  void draw(Canvas canvas, Size size);
}
