import 'package:flutter/material.dart';
import 'package:intership_project/domain/factories/screen_factory.dart';

class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const mainScreen = '/main_screen';
  static const orderScreen = '/order_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    //loader
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    //main screen
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
    //order screen
    MainNavigationRouteNames.orderScreen: (_) =>
        _screenFactory.makeOrderScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const Text('404'),
    );
  }
}
