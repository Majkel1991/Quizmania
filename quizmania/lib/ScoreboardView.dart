import 'package:flutter/material.dart';

class ScoreboardView extends StatefulWidget {
  ScoreboardView({Key key}) : super(key: key);

  @override
  _ScoreboardViewState createState() => _ScoreboardViewState();
}

class _ScoreboardViewState extends State<ScoreboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Scoreboard")));
  }
}
