import 'package:connectivity/connectivity.dart';

/*
   *Funcion para validar la conexion de internet en el dispositivo, se valida si hay una conexion de wife o
   *de datos en el movil. 
   */
Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}