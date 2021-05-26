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
      case RoutingConstants.mainViewRoute:
        return MaterialPageRoute(builder: (context) => MainView());
      case RoutingConstants.geografieViewRoute:
        return MaterialPageRoute(builder: (context) => GeografieView());
      case RoutingConstants.fernsehserienRoute:
        return MaterialPageRoute(builder: (context) => FernsehserienView());
      case RoutingConstants.filmeViewRoute:
        return MaterialPageRoute(builder: (context) => FilmeView());
      case RoutingConstants.geschichteViewRoute:
        return MaterialPageRoute(builder: (context) => GeschichteView());
      case RoutingConstants.kunstViewRoute:
        return MaterialPageRoute(builder: (context) => KunstView());
      case RoutingConstants.literaturViewRoute:
        return MaterialPageRoute(builder: (context) => LiteraturView());
      case RoutingConstants.sportViewRoute:
        return MaterialPageRoute(builder: (context) => SportView());
      case RoutingConstants.scoarboardViewRoute:
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
