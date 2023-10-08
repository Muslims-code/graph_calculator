# Graph Calculator Package

A Flutter package for creating interactive and customizable graphs in your Flutter applications.

![graph_calculator](https://github.com/Muslims-code/graph_calculator/assets/68555232/74089beb-fb16-42a2-9c78-10934e7d3912)


## Features

- Plot mathematical functions on a graph.
- Customize graph appearance, including colors, grid settings, and more.
- Easily integrate graphs into your Flutter apps.

## Installation

```bash
flutter pub add graph_calculator
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:graph_calculator/controllers/graph_controller.dart';
import 'package:graph_calculator/models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Graph Calculator Example'),
        ),
        body: Center(
          child: GraphWidget(
            graphController: GraphController(graph: Graph()),
          ),
        ),
      ),
    );
  }
}
```

For detailed usage instructions and examples, please check out the [example](https://github.com/Muslims-code/graph_calculator/blob/main/example/main.dart) provided in this package.

## Customization

You can customize various aspects of the graph, such as colors, grid settings, and more, by configuring the `Graph` class and the `GraphController`.

```dart
GraphController(
  graph: Graph(
    gridStep: 50,
    backgroundColor: Colors.blueGrey,
    axesColor: Colors.white,
    gridColor: Colors.grey,
    gridWidth: 1.0,
    axesWidth: 2.0,
    drawAxes: true,
    drawNumbers: true,
  ),
);
```

## Contributions

Contributions and feedback are welcome! If you have any suggestions or find issues, please feel free to [create an issue](https://github.com/Muslims-code/graph_calculator/issues) or submit a pull request.

## License

This package is open-source and available under the [MIT License](LICENSE).
