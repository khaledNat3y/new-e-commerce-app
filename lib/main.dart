import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/di/dependency_injection.dart';
import 'package:new_e_commerce_app/core/helpers/storage_helper.dart';
import 'package:new_e_commerce_app/core/networking/firebase_messaging_config.dart';
import 'package:new_e_commerce_app/core/networking/firebase_notification.dart';
import 'package:new_e_commerce_app/core/url_accorrding_to_release_or_prod/environment_config.dart';
import 'firebase_options.dart';
import 'styliq_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // EnvironmentConfig.configure();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  // await checkIfLoggedInUser();
  await NotificationService.instance.initialize();
  runApp(const StyliqApp());
}
// checkIfLoggedInUser() async {
//   String? userToken =
//   await getIt<StorageHelper>().getToken();
//   if (!userToken.isNullOrEmpty()) {
//     isLoggedInUser = true;
//   } else {
//     isLoggedInUser = false;
//   }
// }



