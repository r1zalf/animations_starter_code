import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> currentPalette = generateRandomPalette();

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  void regeneratePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette Generator'),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: regeneratePalette,
        child: const Text('Generate New Palette'),
      ),
      body: ListView(
        children: [
          for (Color color in currentPalette)
            AnimatedContainer(
              width: 100,
              height: 100,
              color: color,
              margin: const EdgeInsets.all(8),
              duration: const Duration(milliseconds: 800),
              curve: Curves.linear,
            ),
        ],
      ),
    );
  }
}
