import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:unitpay/src/services/auth_api.dart';
import 'package:unitpay/src/utils/responsive.dart';
import 'package:unitpay/src/utils/utils.dart';
import 'package:unitpay/src/widgets/button-widget.dart';
import 'package:unitpay/src/widgets/circle_widget.dart';
import 'package:unitpay/src/widgets/input_text_widget.dart';

/// Pagina de Registro.
/// [View] `RegisterPage`
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _authApiService = AuthApiService();

  String _email = '', _password = '';
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  _sumbit() async {
    if (_isFetching) {
      return;
    }
    if (!_formKey.currentState.validate()) {
      return;
    }

    setState(() {
      _isFetching = true;
    });

    final isOk = await _authApiService.register(context,
        email: _email, password: _password);

    setState(() {
      _isFetching = false;
    });

    if (isOk) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Inicializa los métodos de la clase Responsive
    final _responsive = Responsive.of(context);

    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: <Widget>[
              _backgroundBackBottom(_responsive),
              _backgroundFrontBottom(_responsive),
              SingleChildScrollView(
                child: Container(
                  width: _responsive.wp(100),
                  height: _responsive.hp(100),
                  child: SafeArea(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: _responsive.hp(30)),
                          _sectionInputs(_responsive),
                          SizedBox(height: _responsive.hp(2)),
                          _botonSignUp(_responsive),
                          SizedBox(height: _responsive.hp(1))
                        ],
                      ),
                      Column(
                        children: <Widget>[_sectionTitle(context, _responsive)],
                      )
                    ],
                  )),
                ),
              )
            ],
          )),
    );
  }

  /// Crea un background en la parte inferior atras
  Widget _backgroundBackBottom(Responsive responsive) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: responsive.wp(-10),
            top: responsive.hp(12),
            child: _circleRed(responsive, 40)),
        Positioned(
            left: responsive.wp(6),
            top: responsive.hp(8),
            child: _circleRed(responsive, 20)),
        Positioned(
            left: responsive.wp(13),
            top: responsive.hp(10),
            child: _circleRed(responsive, 30)),
        Positioned(
            left: responsive.wp(45),
            top: responsive.hp(15),
            child: _circleRed(responsive, 30)),
        Positioned(
            left: responsive.wp(80),
            top: responsive.hp(10),
            child: _circleRed(responsive, 30)),
        Positioned(
            left: responsive.wp(-50),
            top: responsive.hp(30),
            child: _circleRed(responsive, 100))
      ],
    );
  }

  /// Crea un background en la parte inferior adelante
  Widget _backgroundFrontBottom(Responsive responsive) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: responsive.wp(8),
            top: responsive.hp(20),
            child: _circleRojoObscuro(responsive, 30)),
        Positioned(
            left: responsive.wp(6),
            top: responsive.hp(18),
            child: _circleRojoObscuro(responsive, 2)),
        Positioned(
            left: responsive.wp(14),
            top: responsive.hp(4),
            child: _circleRojoObscuro(responsive, 1)),
        Positioned(
            left: responsive.wp(38),
            top: responsive.hp(59),
            child: _circleRojoObscuro(responsive, 5)),
        Positioned(
            left: responsive.wp(42),
            top: responsive.hp(65),
            child: _circleRojoObscuro(responsive, 2)),
        Positioned(
            left: responsive.wp(53),
            top: responsive.hp(80),
            child: _circleRojoObscuro(responsive, 10)),
        Positioned(
            left: responsive.wp(80),
            top: responsive.hp(60),
            child: _circleRojoObscuro(responsive, 15)),
        Positioned(
            left: responsive.wp(86),
            top: responsive.hp(10),
            child: _circleRojoObscuro(responsive, 1)),
        Positioned(
            left: responsive.wp(90),
            top: responsive.hp(97),
            child: _circleRojoObscuro(responsive, 2)),
        Positioned(
            left: responsive.wp(96),
            top: responsive.hp(94),
            child: _circleRojoObscuro(responsive, 3)),
      ],
    );
  }

  /// Crea un circulo rojo
  CircleWidget _circleRed(Responsive responsive, double size) {
    return CircleWidget(radius: responsive.wp(size), colors: [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColor
    ]);
  }

  /// Crea un circulo rojo obscuro
  CircleWidget _circleRojoObscuro(Responsive responsive, double size) {
    return CircleWidget(
        radius: responsive.wp(size),
        colors: [Theme.of(context).accentColor, Theme.of(context).accentColor]);
  }

  /// Crea titulo
  Widget _sectionTitle(BuildContext context, Responsive responsive) {
    return Text(
      "Registro",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Theme.of(context).backgroundColor,
          fontSize: responsive.ip(2),
          fontWeight: FontWeight.w500),
    );
  }

  /// Crea los inputs de `email` y `password`
  Widget _sectionInputs(Responsive responsive) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350.0, minWidth: 350.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputTextWidget(
                  label: 'Correo electrónico',
                  textInputType: TextInputType.emailAddress,
                  fontSize: responsive.ip(1.8),
                  validator: (String text) => checkEmail(text),
                  maxCharacteresInput: 25,
                  color: 'Secondary'),
              SizedBox(height: responsive.hp(3)),
              InputTextWidget(
                  label: 'Contraseña',
                  fontSize: responsive.ip(1.8),
                  isSecure: true,
                  validator: (String text) => checkPassword(text),
                  maxCharacteresInput: 10,
                  color: 'Secondary')
            ],
          ),
        ));
  }

  /// Crea un boton de Registro
  Widget _botonSignUp(Responsive responsive) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350.0, minWidth: 350.0),
        child: ButtonWidget(
          label: 'Registrarse',
          colorButton: 'Primary',
          shadow: true,
          onClick: () => _sumbit(),
        ));
  }
}
