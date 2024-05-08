import 'dart:io';

import 'package:blog_app/pages/page_route.dart';
import 'package:blog_app/pages/page_route_name.dart';
import 'package:blog_app/service/deepLinkiing/deep_link_service.dart';
import 'package:blog_app/service/pref_manager.dart';
import 'package:blog_app/utils/custColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.developement_Platform,
  );
  DeepLinkService.instance?.handleDynamicLinks();
  HttpOverrides.global = MyHttpOverrides();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Blog App',
        color: AppColors.green,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: route_blogList,
        getPages: AppPages.pages);
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}