import 'package:flutter/material.dart';
import 'package:graph_calculator/graph_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var graphController = GraphController(
      graph: Graph(
          gridStep: 100, numbersStyle: const TextStyle(color: Colors.black)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GraphWidget(
          graphController: graphController,
          size: MediaQuery.of(context).size,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(Icons.line_axis_rounded),
              onPressed: () {
                setState(() {
                  graphController.addFunction(GraphFunction(
                      function: (x) {
                        return x * x;
                      },
                      color: Colors.red));
                });
              }),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(Icons.center_focus_strong),
              onPressed: () {
                setState(() {
                  graphController.backToHome();
                });
              })
        ],
      ),
    );
  }
}
