import 'package:flutter/foundation.dart';
import 'package:new_e_commerce_app/core/url_accorrding_to_release_or_prod/environment.dart';

class EnvironmentConfig {
  static void configure() {
    if(kReleaseMode) {
      Environment.baseUrl = "https://api.styliq.app";
    }else {
      Environment.baseUrl = "https://api.styliq.app";
    }
  }
}