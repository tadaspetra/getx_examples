import 'package:getx_cli/app/modules/login/login_view.dart';
import 'package:getx_cli/app/modules/login/login_binding.dart';
import 'package:getx_cli/app/modules/home/home_view.dart';
import 'package:getx_cli/app/modules/home/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN, 
      page:()=> LoginView(), 
      binding: LoginBinding(),
    ),
  ];
}