import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/core/helpers/check_internet.dart';

class SafeOnTap {
  static Future<void> execute({
    required BuildContext context,
    required Future<void> Function() onTap,
    VoidCallback? onNoConnection,
  }) async {
    ScaffoldMessenger.of(context).clearSnackBars();
    try {
      final hasConnection = await ConnectivityHelper.hasRealInternetConnection();
      if (hasConnection) {
        await onTap();
      } else {
        if(onNoConnection != null) {
          onNoConnection();
        }else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No internet connection! Please reconnect and try again!"),
            ),
          );
        }
      }
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Unexpected error: $e"),
        ),
      );
    }
  }
}