import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitpay/src/utils/responsive.dart';

class ButtonWidget extends StatefulWidget {
  final String label;
  final String colorButton;
  final String colorText;
  final bool shadow;
  final VoidCallback onClick;

  /// Clase para para crear [button] personalizado.
  /// * `@label` [null] Texto a mostrar
  /// * `colorButton` [null] Tema de boton
  /// * `colorText` [null] Tema de boton
  /// * `shadow` [false] Sombra de boton
  /// * `@onClick` [null] Evento al presionar el boton
  ButtonWidget(
      {Key key,
      @required this.label,
      this.colorButton,
      this.colorText,
      this.shadow = false,
      @required this.onClick})
      : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final _responsive = Responsive.of(context);
    final _colorButton = (widget.colorButton != null) ? _getColors(context, widget.colorButton) : null;
    final _colorText = _getColors(context, widget.colorText);

    if (_colorButton != null) {
      return Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: _colorButton.withOpacity(0.45),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: CupertinoButton(
          onPressed: widget.onClick,
          color: _colorButton,
          padding: EdgeInsets.symmetric(vertical: _responsive.ip(2)),
          borderRadius: BorderRadius.circular(10.0),
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: _responsive.ip(1.7),
                fontWeight: FontWeight.w600,
                fontFamily: 'Quicksand',
                letterSpacing: 1.5),
          ),
        ),
      );
    } else {
      return  CupertinoButton(
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: _responsive.ip(1.5),
                fontWeight: FontWeight.w500,
                color: _colorText,
                fontFamily: 'Quicksand',
                letterSpacing: .9),
          ),
          onPressed: widget.onClick,
        );
    }
  }
}

/// Obtiene el color correspondiente.
Color _getColors(BuildContext context, String color) {
  if (color == 'Primary') {
    return Theme.of(context).secondaryHeaderColor;
  } else if (color == 'Secondary') {
    return Theme.of(context).accentColor;
  } else {
    return Theme.of(context).primaryColorLight;
  }
}