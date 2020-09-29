import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Banner(
      location: BannerLocation.topStart,
      message: "GetX",
      child: child,
    );
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeControllerBinding()),
  ];
}
