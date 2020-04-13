import 'package:flutter/material.dart';
import 'package:unitpay/src/pages/home_page.dart';
import 'package:unitpay/src/pages/login_page.dart';
import 'package:unitpay/src/pages/register_page.dart';
import 'package:unitpay/src/pages/splash_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
        '/'           : (BuildContext context) => HomePage(),
        'splash'           : (BuildContext context) => SplashPage(),
        'login'       : (BuildContext context) => LoginPage(),
        'register'    : (BuildContext context) => RegisterPage()
  };
}