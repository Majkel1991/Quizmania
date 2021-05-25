import 'package:flutter/material.dart';
import 'package:quizmania/Views/FernsehserienView.dart';
import '../Views/FilmeView.dart';
import '../Views/GeografieView.dart';
import '../Views/GeschichteView.dart';
import '../Views/KunstView.dart';
import '../Views/LiteraturView.dart';
import '../Constants/RoutingConstants.dart';
import '../Views/ScoreboardView.dart';
import '../Views/SportView.dart';
import '../main.dart';
import '../Views/FernsehserienView.dart';

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
      case RoutingConstants.ScoarboardViewRoute:
        return MaterialPageRoute(builder: (context) => ScoreboardView());
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
