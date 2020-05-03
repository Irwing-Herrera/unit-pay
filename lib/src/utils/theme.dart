import 'package:flutter/material.dart';
import 'package:unitpay/src/utils/responsive.dart';

/// Construccion de tema.
/// [Theme] `getTheme`
Theme getTheme(BuildContext context, Widget widget) {
  final _responsive = Responsive.of(context);

  final brightness = Brightness.light;

  /// Colores de app
  final _red = Color(0xffE32F22);
  final _redAccent = Color(0xffD50F02);
  final _black = Color(0xff282829);
  final _gray = Color(0xff7d91a8);
  final _grayLight = Color(0xffB0B6BE);
  final _white = Color(0xfffafbfb).withOpacity(0.8);
  final _whiteAccent = Color(0xffffffff);

  final themeData = ThemeData(
    brightness: brightness,
    primaryColor: _red,
    primaryColorLight: _grayLight,
    backgroundColor: _white,
    secondaryHeaderColor: _black,
    accentColor: _redAccent,
    fontFamily: 'Quicksand',
    textTheme: TextTheme(
      title: _getStyle(_gray,FontWeight.w400,_responsive.ip(2.5),0.9),
      subtitle: _getStyle(_gray,FontWeight.w400,_responsive.ip(2.0),0.9),
      display1: _getStyle(_gray,FontWeight.w500,_responsive.ip(1.5),0.9),
      display2: _getStyle(_gray,FontWeight.w300,_responsive.ip(1.5),0.9),
      display3: _getStyle(_black,FontWeight.w400,_responsive.ip(1.5),0.9),
      display4: _getStyle(_whiteAccent,FontWeight.w600,_responsive.ip(1.5),0.9),
      headline: _getStyle(_white,FontWeight.w600,_responsive.ip(1.8),0.9),
      body1: _getStyle(_red,FontWeight.w500,_responsive.ip(1.2),1),
      body2: _getStyle(_whiteAccent,FontWeight.w500,_responsive.ip(1.2),1),
    )
  );

  return Theme(
    data: themeData,
    child: widget,
  );
}

TextStyle _getStyle(
    Color color, FontWeight weight, double size, double spacing) {
  return TextStyle(
      color: color, fontWeight: weight, fontSize: size, letterSpacing: spacing);
}
