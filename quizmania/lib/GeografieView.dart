import 'package:flutter/material.dart';
import 'package:quizmania/textConstants.dart';

class GeografieView extends StatelessWidget {
  const GeografieView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.public),
          centerTitle: true,
          title: Text(TextConstants.appBarGeografie),
        ),
        body: Center(child: Text("Geografie")));
  }
}
