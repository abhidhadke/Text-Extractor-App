
import 'package:textscanner/meta/view/appInfo/appInfo.dart';
import 'package:textscanner/meta/view/homeView/home.view.dart';

class AppRoutes {
  static const String homeRoute = "/home";
  static const String aboutMe = "/aboutMe";

  static final routes = {
    homeRoute: (context) => const HomeView(),
    aboutMe: (context) => const MyAppInfo()
  };
}
