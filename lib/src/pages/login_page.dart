import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:unitpay/src/utils/utils.dart';
import 'package:unitpay/src/widgets/circle_widget.dart';
import 'package:unitpay/src/widgets/input_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _sumbit() {
    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              _circleTopRigth(),
              _circleTopLeft(),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            _boxTop(),
                            SizedBox(height: 30),
                            _textWelcome()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            _inputsText(),
                            SizedBox(height: 40.0),
                            _botonSingIn(),
                            SizedBox(height: 20.0),
                            _textBottom(),
                            SizedBox(height: size.height * 0.08)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleTopRigth() {
    final size = MediaQuery.of(context).size;

    return Positioned(
      right: -size.width * 0.22,
      top: -size.width * 0.40,
      child: CircleWidget(
          radius: size.width * 0.45, colors: [Color(0xff2a3547), Color(0xff273747)]),
    );
  }

  Widget _circleTopLeft() {
    final size = MediaQuery.of(context).size;

    return Positioned(
      left: -size.width * 0.15,
      top: -size.width * 0.40,
      child: CircleWidget(
          radius: size.width * 0.35,
          colors: [Color(0xfffba70f), Color(0xffffa401)]),
    );
  }

  Container _boxTop() {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.only(top: size.width * 0.2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 25)]),
    );
  }

  Widget _textWelcome() {
    return Text(
      "Hello again.\nWelcome back",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
    );
  }

  Widget _botonSingIn() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 350.0, minWidth: 350.0),
      child: CupertinoButton(
        onPressed: () => _sumbit(),
        color: Color(0xff2a3547),
        padding: EdgeInsets.symmetric(vertical: 17.0),
        borderRadius: BorderRadius.circular(10.0),
        child: Text(
          "Sing In",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  Widget _textBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Here to Friendly Dou!",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Colors.black54),
        ),
        CupertinoButton(
          child: Text(
            "Sing Up",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Color(0xfffba70f)),
          ),
          onPressed: () => Navigator.pushNamed(context, 'register'),
        )
      ],
    );
  }

  Widget _inputsText() {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350.0, minWidth: 350.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputTextWidget(
                label: 'EMAIL ADDRESS',
                validator: (String text) {
                  if (RegExp(patternEmail).hasMatch(text)) {
                    return null;
                  }
                  return "Ingresa un Correo Valido";
                },
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30.0),
              InputTextWidget(label: 'PASSWORD', isSecure: true)
            ],
          ),
        ));
  }
}
