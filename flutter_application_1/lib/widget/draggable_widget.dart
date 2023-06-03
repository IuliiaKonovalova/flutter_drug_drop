import 'package:flutter/material.dart';

import '../data/data.dart';

class DraggableWidget extends StatelessWidget {
  final Animal animal;

  const DraggableWidget({
    Key? key,
    required this.animal,
  }) : super(key: key);

  static double size = 150;

  @override
  Widget build(BuildContext context) => Draggable<Animal>(
        data: animal,
        feedback: buildImage(),
        child: buildImage(),
        childWhenDragging: Container(
          height: size,
        ),
      );

  Widget buildImage() => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          animal.imageUrl,
          // fit: BoxFit.cover,
        ),
      );
}
