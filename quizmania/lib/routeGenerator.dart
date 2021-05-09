import 'package:flutter/material.dart';
import 'TopicView.dart';
import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => MainView());
      case "/TopicView":
        return MaterialPageRoute(builder: (_) => TopicView(text: args));
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
