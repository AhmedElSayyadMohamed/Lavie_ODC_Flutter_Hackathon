import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/layout/layout.dart';
import 'package:lavie/presentation_layer/screens/AutinticationScreen/autintication_screen.dart';
import 'package:lavie/presentation_layer/screens/blogs_details_screen/blog_detail_screen.dart';
import 'package:lavie/presentation_layer/screens/cart_screen/cart_screen.dart';
import 'package:lavie/presentation_layer/screens/search_screen/search_screen.dart';
import 'package:lavie/presentation_layer/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String authenticationRoute = "/authentication";
  static const String layoutRoute = "/layout";
  static const String searchRoute = "/search";
  static const String cartRoute = "/cart";
  static const String profileRoute = "/profile";
  static const String scanRoute = "/scan";
  static const String scanDetailsRoute = "/scanDetails";
  static const String blogDetailsScreen = "/blogDetailsScreen";
}

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.authenticationRoute:
        return MaterialPageRoute(builder: (_) => AuthenticationScreen());
      case Routes.layoutRoute:
        return MaterialPageRoute(builder: (_) => LayoutScreen());

      case Routes.searchRoute:
        return CupertinoPageRoute(builder: (_) => SearchScreen());
        case Routes.cartRoute:
        return CupertinoPageRoute(builder: (_) => CardScreen());
        case Routes.blogDetailsScreen:
        return CupertinoPageRoute(builder: (_) => BlogDetailsScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(child: Text("undefinedRoute")),
            ));
  }
}