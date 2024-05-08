import 'package:flutter_getx/pages/first_page.dart';
import 'package:flutter_getx/pages/home_page.dart';
import 'package:flutter_getx/pages/second_page.dart';
import 'package:flutter_getx/pages/welcome_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const initialRoute = '/welcome';

  static final routes = [
    GetPage(name: '/welcome', page: () => const WelcomePage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/first-page', page: () => const FirstPage()),
    GetPage(name: '/second-page/:number', page: () => const SecondPage()),
  ];
}
