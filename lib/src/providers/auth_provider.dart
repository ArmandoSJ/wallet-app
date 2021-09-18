import 'package:http/http.dart' as http;
import 'package:wallet_app/src/providers/providers.dart';


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

    final vUrl = Uri.parse(Constants.URL_BASE + Constants.URL_LOGIN);

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
        //await storage.write(key: 'token', value: decodedResp['token']);
        return null;
      } else {
        return "El usuario y/o contraseña no son correctas";
      }
    }
  }

  Future logout() async {
    //await storage.delete(key: 'token');
    //_prefs.usuarioid = "";
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
