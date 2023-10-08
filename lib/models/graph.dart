import 'package:flutter/material.dart';
import 'package:graph_calculator/models/models.dart';

/// Represents a graph configuration and settings.
class Graph {
  final double sensibility; // The sensitivity of the graph.
  final TextStyle numbersStyle; // The style of numbers displayed on the graph.
  final Color backgroundColor; // The background color of the graph.
  final Color axesColor; // The color of the graph axes.
  final Color gridColor; // The color of the grid lines.
  final double gridWidth; // The width of the grid lines.
  final double axesWidth; // The width of the axes lines.
  final bool drawAxes; // Whether to draw the graph axes.
  final bool drawNumbers; // Whether to draw numbers on the graph.
  final List<DrawableObject> constObjects =
      []; // List of constant drawable objects.
  List<GraphFunction> functions =
      []; // List of mathematical functions to be plotted.
  double gridStep; // The step size of the grid.
  List<DrawableObject> drawableObjects = []; // List of drawable objects.
  GraphOffset focusPoint = GraphOffset(0, 0); // The focus point of the graph.

  /// Creates a [Graph] instance with the specified configuration and settings.
  Graph({
    this.gridStep = 100,
    this.sensibility = 0.6,
    this.numbersStyle =
        const TextStyle(color: Colors.white, backgroundColor: Colors.black),
    this.backgroundColor = Colors.black,
    this.axesColor = Colors.white,
    this.gridColor = Colors.grey,
    this.gridWidth = 1.0,
    this.axesWidth = 2.0,
    this.drawAxes = true,
    this.drawNumbers = true,
  });
}
