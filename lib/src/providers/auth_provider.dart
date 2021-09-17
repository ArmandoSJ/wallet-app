import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/src/backend/models/user_model.dart';
import 'package:wallet_app/src/utils/preferencias_usuario.dart';

class SessionProvider extends ChangeNotifier {
  final _prefs = new PreferenciasUsuario();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /*
   * Metodo que ejecuta el servicio web de session para validar si el usuario se encuentra registrado
   */
  Future<List<User>> session(User usuario) async {
    final vUserID = usuario.vUserId.toString().trim();
    //final url = Uri.parse(constants.URL_BASE + constants.URL_GET_STATUS_USER + vUserID);
    final vUrl = Uri.parse("");

    final List<User> usuariosList = [];

    final value = sessionToJson(usuario);

    final vResponse = await http.post(vUrl, body: '[ $value ]', headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    if (vResponse.statusCode == 200) {
      final mapResponse = json.decode(vResponse.body);
      if (mapResponse.isEmpty) return [];

      for (var item in mapResponse[0]) {
        final vUser = User.fromJsonList(item);
        usuariosList.add(vUser);
      }
    }

    _prefs.usuarioid = usuariosList[0].vUserId ?? "userUndifined";
    _prefs.setEmail = usuariosList[0].vEmail ?? "emailUndifined";
    _prefs.setName = usuariosList[0].vName ?? "nameUndifined";

    return usuariosList;
  }
}