import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitpay/src/utils/session.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final _session = Session();

  @override
  void initState() { 
    super.initState();
    this.chek();
  }

  chek() async {
    final data = await _session.get();
    if (data != null) {
      Navigator.pushReplacementNamed(context, 'login');

      // Navigator.pushReplacementNamed(context, '/');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(radius: 15.0)
      ),
    );
  }
}