
import 'package:http/http.dart' as http;
import 'package:wallet_app/src/providers/providers.dart';

class ServiciosProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isSaving = false;

  final _prefs = new PreferenciasUsuario();

  Future<List<Services>> getServices(String status) async {

        final vUrl = Uri.parse(Constants.URL_BASE + Constants.URL_SERVICES+"?status="+status);

        final List<Services> servicesList = [];

          final vResponse = await http.get(vUrl, headers: {
            "Authorization" :  _prefs.usuarioid,
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*", // Required for CORS support to work
            "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          });

    if (vResponse.statusCode == 201) {
      final Map<String, dynamic> decodedResp = json.decode(vResponse.body);

    }
        return servicesList;
  }


    Future<Map> doPayment(String status) async {

        final vUrl = Uri.parse(Constants.URL_BASE + Constants.URL_DO_PAYMENT);

        final Map servicesList = {};

          final vResponse = await http.get(vUrl, headers: {
            "Authorization" :  _prefs.usuarioid,
            "Access-Control-Allow-Origin": "*", // Required for CORS support to work
            "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          });

        return servicesList;
  }

}