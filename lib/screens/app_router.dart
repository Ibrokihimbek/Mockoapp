import 'package:flutter/material.dart';
import 'package:mockoapp/screens/api_screen/mocko_page.dart';
import 'package:mockoapp/screens/file_pic/file_pick_page.dart';

abstract class RouteName {
  static const mocko = 'mocko';
  static const file = 'file';
}

class AppRouts {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.file:
        return MaterialPageRoute(builder: (_) => FilePickPage());
      case RouteName.mocko:
        return MaterialPageRoute(builder: (_) => MockoPage());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}