import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final String label;
  final Function(String) validator;
  final bool isSecure;
  final TextInputType textInputType;

  InputTextWidget({Key key, @required this.label, this.validator, this.isSecure = false, this.textInputType = TextInputType.text}) : super(key: key);

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      obscureText: widget.isSecure,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0)
      ),
    );
  }
}