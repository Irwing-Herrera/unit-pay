import 'package:flutter/material.dart';
import 'package:unitpay/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Pay',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: getApplicationRoutes()
    );
  }
}