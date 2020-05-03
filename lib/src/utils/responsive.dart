import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

class Responsive {
  double width, height, inch;

  Responsive({
    @required this.width,
    @required this.height,
    @required this.inch,
  });

  /// Clase para obtener porcentajes exactos de cada dispositivo.
  /// * {BuildContext} `context`
  factory Responsive.of(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final size = data.size;
    // c2 = a2+b2 => c = sqrt(a2+b2)
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsive(width: size.width, height: size.height, inch: inch);
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