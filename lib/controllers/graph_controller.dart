/// This file defines a [GraphController] class for controlling a graph in a Flutter app.

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:graph_calculator/models/models.dart';

/// The [GraphController] class controls a graph.
class GraphController {
  final Graph graph;

  /// Creates a [GraphController] instance with the specified [graph].
  GraphController({
    required this.graph,
  });

  /// Draws the graph axes on the given [canvas] with the provided [size].
  void drawAxes(
    Canvas canvas,
    Size size,
  ) {
    var xAddition = -graph.focusPoint.x;
    var yAddition = -graph.focusPoint.y;
    addObject(GraphLine(
        color: graph.axesColor,
        startOffset: Offset(-(size.width / 2 + xAddition.abs()), 0),
        endOffset: Offset(size.width / 2 - xAddition, 0),
        lineWidth: graph.axesWidth));
    addObject(GraphLine(
        lineWidth: graph.axesWidth,
        color: graph.axesColor,
        startOffset: Offset(0, -(size.height / 2 + yAddition.abs())),
        endOffset: Offset(0, size.height / 2 + yAddition.abs())));
  }

  /// Adds a mathematical function to the list of functions to be drawn on the graph.
  void addFunction(GraphFunction function) {
    graph.functions.add(function);
  }

  /// Draws all the mathematical functions on the graph canvas with the given [size].
  void drawFunctions(Canvas canvas, Size size) {
    for (var function in graph.functions) {
      function.draw(canvas, size, graph);
    }
  }

  /// Adds a drawable object to the list of objects to be drawn on the graph.
  void addObject(DrawableObject object) {
    graph.drawableObjects.add(object);
  }

  /// Draws all the drawable objects on the graph canvas with the given [size].
  void drawObjects(Canvas canvas, Size size) {
    for (var constObject in graph.constObjects) {
      addObject(constObject);
    }
    for (var object in graph.drawableObjects) {
      object.draw(canvas, size);
    }
    graph.drawableObjects = [];
  }

  /// Adds numbers to the graph indicating the grid steps.
  void addNumbers(Canvas canvas, Size size) {
    double xPositiveLength = size.width / 2 + graph.focusPoint.x;
    double yPositiveLength = (size.height / 2 + graph.focusPoint.y);

    var counter = 0;
    var pointsCountFromBeginning = (xPositiveLength / graph.gridStep).floor();

    // Determine how many grid steps are on the screen.
    for (double i = 0; i <= size.width; i += graph.gridStep) {
      var offset = Offset(
          (graph.gridStep * (pointsCountFromBeginning - counter)).toDouble() -
              4,
          0);
      if ((pointsCountFromBeginning - counter) != 0) {
        addObject(GraphLine(
            color: graph.gridColor,
            startOffset: Offset(
                offset.dx + 4, -(size.height / 2 + graph.focusPoint.y.abs())),
            endOffset: Offset(
                offset.dx + 4, size.height / 2 + graph.focusPoint.y.abs()),
            lineWidth: graph.gridWidth));
        addObject(GraphText(
            text: (pointsCountFromBeginning - counter).toString(),
            offset: offset));
      }
      counter++;
    }
    counter = 0;
    pointsCountFromBeginning = (yPositiveLength / graph.gridStep).floor();
    // Draw numbers on the y-axis.
    for (double i = 0; i <= size.height; i += graph.gridStep) {
      var offset = Offset(
          0,
          (graph.gridStep * (pointsCountFromBeginning - counter)).toDouble() -
              9);
      if (pointsCountFromBeginning - counter != 0) {
        addObject(GraphLine(
            color: graph.gridColor,
            startOffset: Offset(
                -(size.width / 2 + graph.focusPoint.x.abs()), offset.dy + 10),
            endOffset: Offset(
                (size.width / 2 + graph.focusPoint.x.abs()), offset.dy + 10),
            lineWidth: graph.gridWidth));
        addObject(GraphText(
          text: (-(pointsCountFromBeginning - counter)).toString(),
          offset: offset,
        ));
      }
      counter++;
    }
  }

  /// Resets the focus point to the home position (0,0).
  void backToHome() {
    graph.focusPoint = GraphOffset(0, 0);
  }

  /// Adds a constant drawable object to the list of objects to be drawn on the graph.
  void addConstObject(DrawableObject object) {
    graph.constObjects.add(object);
  }
}
