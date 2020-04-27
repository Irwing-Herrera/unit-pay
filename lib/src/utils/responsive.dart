import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

class Responsive {
  double width, height, inch;

  /// Clase para obtener porcentajes exactos de cada dispositivo.
  /// * {BuildContext} `context`
  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;

    width = size.width;
    height = size.height;
    /// Diagonal
    inch = math.sqrt(math.pow(width, 2) + math.pow(height, 2));
  }

  /// Retorna el ancho en base al [percent] recibido.
  double wp(double percent) {
    return width * percent / 100;
  }
  /// Retorna el alto en base al [percent] recibido.
  double hp(double percent) {
    return height * percent / 100;
  }
  /// Retorna el ancho en base al [percent] recibido.
  /// `Se ocupara para textos`
  double ip(double percent) {
    return inch * percent / 100;
  }
}