import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitpay/src/utils/responsive.dart';

class ButtonWidget extends StatefulWidget {
  final String label;
  final String color;
  final VoidCallback onClick;

  /// Clase para para crear [button] personalizado.
  /// * `@label` [null] Texto a mostrar
  /// * `@priority` [null] Tema de boton
  /// * `@onClick` [null] Evento al presionar el boton
  ButtonWidget(
      {Key key,
      @required this.label,
      @required this.color,
      @required this.onClick})
      : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final _responsive = Responsive(context);
    final _color = _getColors(widget.color);

    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: _color.withOpacity(0.45),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: CupertinoButton(
        onPressed: widget.onClick,
        color: _color,
        padding: EdgeInsets.symmetric(vertical: _responsive.ip(2)),
        borderRadius: BorderRadius.circular(10.0),
        child: Text(
          widget.label,
          style: TextStyle(
              fontSize: _responsive.ip(1.7),
              fontWeight: FontWeight.w700,
              fontFamily: 'Quicksand',
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}

/// Obtiene el color correspondiente.
Color _getColors(String priority) {
  if (priority == 'Primary') {
    return Color(0xff282829);
  } else if (priority == 'Secondary') {
    return Color(0xffeb3223);
  } else {
    return Color(0xff000000);
  }
}
