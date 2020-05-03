import 'package:flutter/material.dart';
import 'package:unitpay/src/routes/routes.dart';
import 'package:unitpay/src/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          MediaQuery.of(context);
          return getTheme(context,child);
        },
        title: 'Unit Pay',
        initialRoute: 'splash',
        routes: getApplicationRoutes(),
        debugShowCheckedModeBanner: false);
  }
}