import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget extends StatefulWidget {
  final String label;
  final bool isSecure;
  final double fontSize;
  final Function(String) validator;
  final TextInputType textInputType;
  final int maxCharacteresInput;
  final String color;

  /// Clase para para crear [Inputs] mas eficientes.
  /// * `@label` [null] Texto a mostrar
  /// * `validator` [null] Validación de texto
  /// * `isSecure` [false] Ocultar texto
  /// * `textInputType` [TextInputType.text] Tipo de teclado
  /// * `fontSize` [17] Tamaño de letra
  /// * `maxCharacteresInput` [255] Maximo de caracteres
  /// * `color` [Primary] Color de input 
  InputTextWidget(
      {Key key,
      @required this.label,
      this.validator,
      this.isSecure = false,
      this.textInputType = TextInputType.text,
      this.fontSize = 17,
      this.maxCharacteresInput = 255,
      this.color = 'Primary'})
      : super(key: key);

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {

    final styles = _getThema(widget.color);

    return TextFormField(
      style: styles[0],
      keyboardType: widget.textInputType,
      obscureText: widget.isSecure,
      validator: widget.validator,
      decoration: InputDecoration(
          labelText: widget.label,
          alignLabelWithHint: true,
          labelStyle: styles[1],
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          errorStyle: (widget.color == 'Primary') 
            ? Theme.of(context).textTheme.body1
            : Theme.of(context).textTheme.body2),
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxCharacteresInput)
      ],
    );
  }

  /// Obtiene el tema del input
  /// * `theme` Tema seleccionado
  List<TextStyle> _getThema(String theme) {
    List<TextStyle> styles = [];
    if (theme == "Primary") {
      styles.addAll([Theme.of(context).textTheme.display2,Theme.of(context).textTheme.display3]);
    } else {
      styles.addAll([Theme.of(context).textTheme.headline,Theme.of(context).textTheme.display4]);
    }
    return styles;
  }
}
