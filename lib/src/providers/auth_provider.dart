import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/src/backend/models/user_model.dart';
import 'package:wallet_app/src/utils/preferencias_usuario.dart';

class SessionProvider extends ChangeNotifier {
  final _prefs = new PreferenciasUsuario();

  final storage = new FlutterSecureStorage();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.parse("http://localhost:8080/register");

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('token')) {
      // Token hay que guardarlo en un lugar seguro
      //await storage.write(key: 'token', value: decodedResp['token']);
      // _prefs.usuarioid = decodedResp['token'];
      // decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  /*
   * Metodo que ejecuta el servicio web de session para validar si el usuario se encuentra registrado
   */
  Future<String?> session(User usuario) async {
    final Map<String, dynamic> authData = {
      'email': usuario.vEmail,
      'password': usuario.vPassword
    };

    final vUrl = Uri.parse("http://localhost:8080/login");

    final vResponse = await http.post(vUrl,
        body: json.encode(authData),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });

    if (vResponse.statusCode == 201) {
      final Map<String, dynamic> decodedResp = json.decode(vResponse.body);

      if (decodedResp.containsKey('token')) {
        _prefs.usuarioid = decodedResp['token'];
        //print(decodedResp['token']);
        //await storage.write(key: 'token', value: decodedResp['token']);
        return null;
      } else {
        return "El usuario y/o contraseña no son correctas";
      }
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
