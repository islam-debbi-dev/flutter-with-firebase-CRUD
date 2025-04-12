import 'package:flutter/material.dart';
import 'package:flutter_right_setpes/home_page.dart';
import 'package:flutter_right_setpes/screen/delete.dart';

import '../screen/create.dart';
import '../screen/display.dart';
import '../screen/test_firebase.dart';
import '../screen/update.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/create':
        return MaterialPageRoute(builder: (_) => Create());
      case '/display':
        return MaterialPageRoute(builder: (_) => Display());
      case '/update':
        return MaterialPageRoute(builder: (_) => Update());
      case '/delete':
        return MaterialPageRoute(builder: (_) => Delete());
      case 'test':
        return MaterialPageRoute(builder: (_) => TestFireBase());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
