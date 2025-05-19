import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_and_facebook/app/core/theme/dark.dart';
import 'package:google_and_facebook/app/modules/home/home_bindings.dart';
import 'package:google_and_facebook/app/routes/app_route.dart';

import 'app/core/theme/light.dart';
import 'app/routes/app_pages.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Google and Facebook",
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBindings(),
      theme: AppLightTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}
