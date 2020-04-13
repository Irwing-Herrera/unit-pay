import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dialogs {
  static void alert(BuildContext context, {String title = "", String message = ""}) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title
          ),
          content: Text(
            message
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK")
            )
          ],
        );
      }
    );
  }
}