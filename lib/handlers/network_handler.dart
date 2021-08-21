import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:country_details/contants/internet_connection.dart';

class NetworkHandler {

  static Future<String> checkInternetConnection() async {
    String status;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a mobile network.
        status = InternetConnection.CONNECTED;
      } else {
        // I am connected to no network.
        status = InternetConnection.NOT_CONNECTED;
      }
    } catch (e) {
      status = InternetConnection.NOT_CONNECTED;
      status = 'Exception: ' + e.toString();
    }
    return status;
  }
}
