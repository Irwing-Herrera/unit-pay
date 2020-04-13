import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:unitpay/src/utils/dialogs.dart';
import 'package:unitpay/src/utils/session.dart';

class AuthApiService {

  final _session = Session();

  static const _apiKey = "AIzaSyCcpWMoeHJvpBYTHkGhr16gz3RaV0s3mJU";
  static const _apiHost =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=";

  Future<bool> register(BuildContext context,
      {@required String email, @required String password}) async {
    try {
      final url = "$_apiHost$_apiKey";

      final autData = {
        'email': email,
        'password': password,
        'returnSecureToken': true
      };

      final response = await http.post(url, body: json.encode(autData));

      Map<String, dynamic> decodeResp = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = decodeResp['idToken'] as String;
        final expiresIn = decodeResp['expiresIn'] as String;

        await _session.set(token, int.parse(expiresIn));

        return true;
      } else if (response.statusCode == 400) {
        throw PlatformException(
            code: "400", message: "The Email exists in application");
      }
      throw PlatformException(
          code: "500", message: "Error in method /register/");
    } on PlatformException catch (e) {
      Dialogs.alert(context, title: "ERROR", message: e.message);
      return false;
    }
  }
}
