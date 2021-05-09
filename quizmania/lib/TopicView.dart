import 'package:flutter/material.dart';

class TopicView extends StatelessWidget {
  final String text;
  TopicView({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Quizmania")), body: Text(text));
  }
}
