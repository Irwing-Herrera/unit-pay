import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final double radius;
  final List<Color> colors;

  /// Clase para para crear [circulos] con diseño.
  /// * `@radius` [null] Tamaño de circulo
  /// * `@colors` [null] Arreglo de colores
  const CircleWidget({Key key, @required this.radius, @required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.radius),
          gradient: LinearGradient(
              colors: this.colors,
              begin: Alignment. bottomLeft,
              end: Alignment.topRight)),
    );
  }
}
