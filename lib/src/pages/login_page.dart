import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:unitpay/src/utils/responsive.dart';
import 'package:unitpay/src/utils/utils.dart';
import 'package:unitpay/src/widgets/button-widget.dart';
import 'package:unitpay/src/widgets/circle_widget.dart';
import 'package:unitpay/src/widgets/input_text_widget.dart';

/// Pagina de Login.
/// [View] `LoginPage`
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Se inicializa una key para el formulario
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  /// Obtiene el estado del formulario
  _sumbit() {
    print("aaaaaaa");
    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    /// Inicializa los métodos de la clase Responsive
    final _responsive = Responsive(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: _responsive.wp(100),
          height: _responsive.hp(100),
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
                            SizedBox(height: _responsive.hp(11)),
                            _sectionBoxTop(_responsive),
                            SizedBox(height: _responsive.hp(4)),
                            _sectionSubtitle(_responsive)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            _sectionInputs(_responsive),
                            SizedBox(height: _responsive.hp(4)),
                            _botonSingIn(_responsive),
                            SizedBox(height: _responsive.hp(1)),
                            _sectionFooter(_responsive),
                            SizedBox(height: _responsive.hp(11))
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

  /// Crea un background en la parte inferior atras
  Widget _backgroundBackBottom(Responsive responsive) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: responsive.wp(-10),
            top: responsive.hp(94),
            child: _circleRed(responsive, 15)),
        Positioned(
            left: responsive.wp(6),
            top: responsive.hp(91),
            child: _circleRed(responsive, 15)),
        Positioned(
            left: responsive.wp(20),
            top: responsive.hp(93),
            child: _circleRed(responsive, 15)),
        Positioned(
            left: responsive.wp(40),
            top: responsive.hp(95),
            child: _circleRed(responsive, 10)),
        Positioned(
            left: responsive.wp(53),
            top: responsive.hp(92),
            child: _circleRed(responsive, 13)),
        Positioned(
            left: responsive.wp(70),
            top: responsive.hp(94),
            child: _circleRed(responsive, 12)),
        Positioned(
            left: responsive.wp(85),
            top: responsive.hp(90),
            child: _circleRed(responsive, 12)),
      ],
    );
  }

  /// Crea un background en la parte inferior adelante
  Widget _backgroundFrontBottom(Responsive responsive) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: responsive.wp(8),
            top: responsive.hp(96),
            child: _circleRojoObscuro(responsive, 15)),
        Positioned(
            left: responsive.wp(6),
            top: responsive.hp(96),
            child: _circleRojoObscuro(responsive, 2)),
        Positioned(
            left: responsive.wp(14),
            top: responsive.hp(94),
            child: _circleRojoObscuro(responsive, 1)),
        Positioned(
            left: responsive.wp(38),
            top: responsive.hp(96),
            child: _circleRojoObscuro(responsive, 1)),
        Positioned(
            left: responsive.wp(42),
            top: responsive.hp(98),
            child: _circleRojoObscuro(responsive, 2)),
        Positioned(
            left: responsive.wp(53),
            top: responsive.hp(96.5),
            child: _circleRojoObscuro(responsive, 2)),
        Positioned(
            left: responsive.wp(58),
            top: responsive.hp(96),
            child: _circleRojoObscuro(responsive, 15)),
        Positioned(
            left: responsive.wp(86),
            top: responsive.hp(96),
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

  /// Crea un circulo amarillo
  CircleWidget _circleRed(Responsive responsive, double size) {
    return CircleWidget(
        radius: responsive.wp(size),
        colors: [Color(0xffeb3223), Color(0xffeb3223)]);
  }

  /// Crea un circulo negro
  CircleWidget _circleRojoObscuro(Responsive responsive, double size) {
    return CircleWidget(
        radius: responsive.wp(size),
        colors: [Color(0xffD50F02), Color(0xffD50F02)]);
  }

  /// Crea un contenedor
  Widget _sectionBoxTop(Responsive responsive) {
    return Container(
      width: responsive.wp(24),
      height: responsive.wp(24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 25)]),
    );
  }

  /// Crea un texto
  Widget _sectionSubtitle(Responsive responsive) {
    return Text(
      "Bienvenido a Unit Pay",
      textAlign: TextAlign.center,
      style:
          TextStyle(fontSize: responsive.ip(3), fontWeight: FontWeight.w400, fontFamily: 'Quicksand',color: Color(0xff7d91a8)),
    );
  }

  /// Crea un boton de Inicio de Sesion
  Widget _botonSingIn(Responsive responsive) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 350.0, minWidth: 350.0),
      child: ButtonWidget(
        label: 'Iniciar sesión', 
        color: 'Primary', 
        onClick: () => _sumbit(),
      )
    );
  }

  /// Crea el texto del footer y la navegacion a la vista de registro
  Widget _sectionFooter(Responsive responsive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "¡Ven únete a Unit Pay!",
          style: TextStyle(
              fontSize: responsive.ip(1.5),
              fontWeight: FontWeight.w500,
              color: Color(0xff7d91a8),
              fontFamily: 'Quicksand', letterSpacing: .9)
        ),
        CupertinoButton(
          child: Text(
            "Inscribirse",
            style: TextStyle(
                fontSize: responsive.ip(1.5),
                fontWeight: FontWeight.w600,
                color: Color(0xffEB3223),
                fontFamily: 'Quicksand', letterSpacing: .9),
          ),
          onPressed: () => Navigator.pushNamed(context, 'register'),
        )
      ],
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
                validator: (String text) {
                  if (RegExp(patternEmail).hasMatch(text)) {
                    return null;
                  }
                  return "Ingresa un Correo Valido";
                },
              ),
              SizedBox(height: responsive.hp(3)),
              InputTextWidget(
                  label: 'Contraseña',
                  fontSize: responsive.ip(1.8),
                  isSecure: true)
            ],
          ),
        ));
  }
}
