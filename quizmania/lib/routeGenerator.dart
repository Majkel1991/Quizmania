import 'package:flutter/material.dart';
import 'package:quizmania/FernsehserienView.dart';
import 'FilmeView.dart';
import 'GeografieView.dart';
import 'GeschichteView.dart';
import 'KunstView.dart';
import 'LiteraturView.dart';
import 'RoutingConstants.dart';
import 'SportView.dart';
import 'main.dart';
import 'FernsehserienView.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutingConstants.MainViewRoute:
        return MaterialPageRoute(builder: (context) => MainView());
      case RoutingConstants.GeografieViewRoute:
        return MaterialPageRoute(builder: (context) => GeografieView());
      case RoutingConstants.FernsehserienRoute:
        return MaterialPageRoute(builder: (context) => FernsehserienView());
      case RoutingConstants.FilmeViewRoute:
        return MaterialPageRoute(builder: (context) => FilmeView());
      case RoutingConstants.GeschichteViewRoute:
        return MaterialPageRoute(builder: (context) => GeschichteView());
      case RoutingConstants.KunstViewRoute:
        return MaterialPageRoute(builder: (context) => KunstView());
      case RoutingConstants.LiteraturViewRoute:
        return MaterialPageRoute(builder: (context) => LiteraturView());
      case RoutingConstants.SportViewRoute:
        return MaterialPageRoute(builder: (context) => SportView());
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Error")),
        ),
        body: Center(
          child: Text("This page is not accessible"),
        ),
      );
    });
  }
}
