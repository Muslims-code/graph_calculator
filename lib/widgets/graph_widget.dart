import 'package:flutter/material.dart';
import 'package:graph_calculator/controllers/graph_controller.dart';
import 'package:graph_calculator/models/models.dart';

/// A widget that displays a graph using a custom painter.
class GraphWidget extends StatefulWidget {
  final GraphController _graphController;
  final Size size;

  /// Creates a [GraphWidget] with the specified [graphController] and [size].
  const GraphWidget({
    Key? key,
    required graphController,
    this.size = const Size(100, 100),
  })  : _graphController = graphController,
        super(key: key);

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget._graphController.graph.backgroundColor,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            widget._graphController.graph.focusPoint.y -=
                details.delta.dy * widget._graphController.graph.sensibility;
            widget._graphController.graph.focusPoint.x -=
                details.delta.dx * widget._graphController.graph.sensibility;
          });
        },
        child: CustomPaint(
          size: widget.size,
          isComplex: true,
          painter: GraphPainter(
            focusPoint: widget._graphController.graph.focusPoint,
            graph: widget._graphController.graph,
            controller: widget._graphController,
          ),
        ),
      ),
    );
  }
}

/// A custom painter for drawing a graph.
class GraphPainter extends CustomPainter {
  GraphOffset focusPoint;
  final Graph graph;
  final GraphController controller;

  /// Creates a [GraphPainter] with the specified [focusPoint], [graph], and [controller].
  GraphPainter({
    required this.focusPoint,
    required this.graph,
    required this.controller,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)));
    var xAddition = focusPoint.x;
    var yAddition = focusPoint.y;
    canvas.translate(size.width / 2 - xAddition, size.height / 2 - yAddition);
    if(graph.drawAxes)controller.drawAxes(canvas, size);
    if(graph.drawNumbers)controller.addNumbers(canvas, size);
    controller.drawObjects(canvas, size);
    controller.drawFunctions(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
