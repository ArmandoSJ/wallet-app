  
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nombre
  String get usuarioid {
    return _prefs.getString('usuarioid') ?? '';
  }

  set usuarioid(String value) {
    _prefs.setString('usuarioid', value);
  }

  /*
   * get and set email 
   */
  set setEmail(String email) {
    _prefs.setString('email', email);
  }

  get getEmail {
    return _prefs.getString('email') ?? 'sinCorreo';
  }

  set setName(String name) {
    _prefs.setString('name', name);
  }

  get getName {
    return _prefs.getString('name') ?? 'sin nombre';
  }

  // GET y SET de la última página
  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }

  // GET y SET del _colorSecundario
  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }
}