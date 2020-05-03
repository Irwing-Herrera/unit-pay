import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitpay/src/utils/session.dart';

/// Pagina de Splash.
/// [View] `SplashPage`
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _session = Session();

  @override
  void initState() {
    super.initState();
    this.itAuthenticated();
  }

  /// Verificar si existe token de validación
  itAuthenticated() async {
    final isValid = await _session.get();
    if (isValid != null) {
      Navigator.pushReplacementNamed(context, 'login');
      // Navigator.pushReplacementNamed(context, '/');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image(image: AssetImage('assets/img/loading.gif'), fit: BoxFit.cover),
          Text("Unit Pay",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title)
        ],
      ),
    );
  }
}
