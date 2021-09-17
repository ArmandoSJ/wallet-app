import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/src/utils/preferencias_usuario.dart';

class EpayProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> getUrlPayment(String xml) async {
    final url = Uri.parse('');
    final vResponse = await http.post(url, body: xml, headers: {
      'cache-control': 'no-cache',
      'content-type': 'application/x-www-form-urlencoded'
    });

    Map<String, dynamic>? decodedData = {};

    if (vResponse.statusCode == 200) {
      decodedData = json.decode(vResponse.body);
      return {"status": true, "responseurl": decodedData!['responseurl']};
    } else {
      decodedData = json.decode(vResponse.body);
      return {
        "status": false,
        "message": decodedData!['message'],
        "data": decodedData['data']
      };
    }
  }
}
