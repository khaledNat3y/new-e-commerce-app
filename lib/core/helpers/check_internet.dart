import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper {
  static final Connectivity _connectivity = Connectivity();

  /// check if the device has an internet connection

  static Future<bool> checkInternetConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.vpn)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> hasRealInternetConnection() async {
    log("start looking up for google.com");
    try {
      final lookup = await InternetAddress.lookup('google.com');
      log("google.com is Reached? connection is Safe");
      return lookup.isNotEmpty && lookup.first.rawAddress.isNotEmpty;
    }catch(e) {
      log("google.com is not Reached? connection is not Safe");
      return false;
    }
  }
}
