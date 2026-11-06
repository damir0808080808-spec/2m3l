
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragScreen(),
    );
  }
}

class DragScreen extends StatefulWidget {
  const DragScreen({super.key});

  @override
  State<DragScreen> createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                left: x == 0 ? constraints.maxWidth / 2 - 40 : x,
                top: y == 0 ? constraints.maxHeight / 2 - 40 : y,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      x += details.delta.dx;
                      y += details.delta.dy;

                      if (x < 0) x = 0;
                      if (y < 0) y = 0;

                      if (x > constraints.maxWidth - 80) {
                        x = constraints.maxWidth - 80;
                      }

                      if (y > constraints.maxHeight - 80) {
                        y = constraints.maxHeight - 80;
                      }
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
