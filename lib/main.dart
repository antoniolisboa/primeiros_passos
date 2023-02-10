import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ThreeColorPalette> colorPalettes = [
    const ThreeColorPalette(
      firstColor: Colors.white,
      secondColor: Colors.pinkAccent,
      thirdColor: Colors.lightBlueAccent,
    ),
    const ThreeColorPalette(
      firstColor: Colors.pink,
      secondColor: Colors.purple,
      thirdColor: Colors.blue,
    ),
    const ThreeColorPalette(
      firstColor: Colors.pinkAccent,
      secondColor: Colors.amber,
      thirdColor: Colors.lightBlue,
    ),
    const ThreeColorPalette(
      firstColor: Colors.purpleAccent,
      secondColor: Colors.white,
      thirdColor: Colors.green,
    ),
  ];

  void _incrementPalette() {
    setState(() {
      colorPalettes.add(ThreeColorPalette.generatePalette());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_task),
        title: const Text('Flutter: Primeiros Passos'),
      ),
      body: Container(
        color: Colors.blue[100],
        child: ListView.builder(
          itemCount: colorPalettes.length,
          itemBuilder: (context, index) => colorPalettes[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementPalette,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ThreeColorPalette extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  const ThreeColorPalette({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 100,
            color: firstColor,
          ),
          Container(
            height: 150,
            width: 100,
            color: secondColor,
          ),
          Container(
            height: 150,
            width: 100,
            color: thirdColor,
          )
        ],
      ),
    );
  }

  static Color generateColor() {
    int alpha = Random().nextInt(200); // 0 -- 201 evita transparência extrema
    int red = Random().nextInt(256);
    int green = Random().nextInt(256);
    int blue = Random().nextInt(256);

    return Color.fromARGB(alpha, red, green, blue);
  }

  static ThreeColorPalette generatePalette() {
    Color first = generateColor();
    Color second = generateColor();
    Color third = generateColor();

    return ThreeColorPalette(
      firstColor: first,
      secondColor: second,
      thirdColor: third,
    );
  }
}
