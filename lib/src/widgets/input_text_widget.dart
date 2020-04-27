import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final String label;
  final bool isSecure;
  final double fontSize;
  final Function(String) validator;
  final TextInputType textInputType;

  /// Clase para para crear [Inputs] mas eficientes.
  /// * `@label` [null] Texto a mostrar
  /// * `validator` [null] Validación de texto
  /// * `isSecure` [false] Ocultar texto
  /// * `textInputType` [TextInputType.text] Tipo de teclado
  /// * `fontSize` [17] Tamaño de letra
  InputTextWidget(
      {Key key,
      @required this.label,
      this.validator,
      this.isSecure = false,
      this.textInputType = TextInputType.text,
      this.fontSize = 17})
      : super(key: key);

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Color(0xff75787B), fontFamily: 'Quicksand'),
      keyboardType: widget.textInputType,
      obscureText: widget.isSecure,
      validator: widget.validator,
      decoration: InputDecoration(
          labelText: widget.label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              fontSize: widget.fontSize,
              color: Color(0xff282829),
              fontFamily: 'Quicksand'),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0)),
    );
  }
}
