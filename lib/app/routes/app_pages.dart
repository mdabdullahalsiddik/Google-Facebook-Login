import 'package:get/get.dart';
import 'package:google_and_facebook/app/modules/home/home_bindings.dart';
import 'package:google_and_facebook/app/modules/home/home_page.dart';
import 'package:google_and_facebook/app/modules/login/login_bindings.dart';
import 'package:google_and_facebook/app/modules/login/login_page.dart';

import 'app_route.dart';

class AppPages {
  static final routes = [
   
    GetPage(name: AppRoutes.home, page: () => HomePage(), binding: HomeBindings()),
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: LoginBindings()),
  
  ];
}
