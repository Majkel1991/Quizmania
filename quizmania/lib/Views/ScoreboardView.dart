import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizmania/Views/FernsehserienView.dart';
import 'package:quizmania/Views/GeschichteView.dart';
import 'package:quizmania/Views/KunstView.dart';
import 'package:quizmania/Views/LiteraturView.dart';
import '../Constants/ColorContants.dart';
import 'FilmeView.dart';
import 'GeografieView.dart';
import '../Constants/SizeConstants.dart';
import 'SportView.dart';
import '../Constants/TextConstants.dart';

class ScoreboardView extends StatefulWidget {
  ScoreboardView({Key key}) : super(key: key);

  @override
  _ScoreboardViewState createState() => _ScoreboardViewState();
}

class _ScoreboardViewState extends State<ScoreboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.star),
          centerTitle: true,
          title: Text(TextConstants.appBarScoreboard)),
      body: Center(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            getFutureBuilder(
                future: getGeographyPercentageFuture(),
                header: TextConstants.scoreboardGeografie),
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            getFutureBuilder(
              future: getSportPercentageFuture(),
              header: TextConstants.scoreboardSport,
            ),
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            getFutureBuilder(
                future: getHistoryPercentageFuture(),
                header: TextConstants.scoreboardGeschichte),
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            getFutureBuilder(
                future: getLiteraturePercentageFuture(),
                header: TextConstants.scoreboardLiteratur),
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            getFutureBuilder(
                future: getArtPercentageFuture(),
                header: TextConstants.scoreboardKunst),
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            getFutureBuilder(
                future: getTvPercentageFuture(),
                header: TextConstants.scoreboardTv),
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            getFutureBuilder(
                future: getMoviePercentageFuture(),
                header: TextConstants.scoreboardFilme),
            Padding(padding: EdgeInsets.all(SizeConstants.scoreboardPadding)),
            Container(
              margin: EdgeInsets.all(SizeConstants.scoreboardButtonMargin),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return ColorConstants.ButtonColor;
                      return ColorConstants.ButtonColor;
                    },
                  ),
                ),
                onPressed: () {
                  setState(() {
                    GeografieView.resetScoreAndTotal();
                    SportView.resetScoreAndTotal();
                    GeschichteView.resetScoreAndTotal();
                    LiteraturView.resetScoreAndTotal();
                    KunstView.resetScoreAndTotal();
                    FernsehserienView.resetScoreAndTotal();
                    FilmeView.resetScoreAndTotal();
                  });
                },
                child: Text("Reset Score",
                    style: TextStyle(fontSize: SizeConstants.textSize)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<double> getFutureBuilder({Future future, String header}) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CircularPercentIndicator(
            header: Container(
              padding: EdgeInsets.all(SizeConstants.scoreboardPaddingHeader),
              child: Text(
                header,
                style: TextStyle(fontSize: SizeConstants.textSize),
              ),
            ),
            radius: 100.0,
            lineWidth: 10.0,
            percent: snapshot.data,
            center: Text(snapshot.data.isNaN
                ? "0%"
                : (snapshot.data * 100).toStringAsFixed(2) + "%"),
            progressColor: ColorConstants.BoxColor,
            animation: true,
            animationDuration: SizeConstants.scoreboardAnimationDuration,
          );
        } else {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
      },
    );
  }

  Future<double> getGeographyPercentageFuture() async {
    int score = await GeografieView.getScoreFromSharedPref();
    int total = await GeografieView.getTotalFromSharedPref();
    print(score / total);
    return (score / total);
  }

  Future<double> getSportPercentageFuture() async {
    int score = await SportView.getScoreFromSharedPref();
    int total = await SportView.getTotalFromSharedPref();
    print(score / total);
    return (score / total);
  }

  Future<double> getHistoryPercentageFuture() async {
    int score = await GeschichteView.getScoreFromSharedPref();
    int total = await GeschichteView.getTotalFromSharedPref();
    print(score / total);
    return (score / total);
  }

  Future<double> getLiteraturePercentageFuture() async {
    int score = await LiteraturView.getScoreFromSharedPref();
    int total = await LiteraturView.getTotalFromSharedPref();
    print(score / total);
    return (score / total);
  }

  Future<double> getArtPercentageFuture() async {
    int score = await KunstView.getScoreFromSharedPref();
    int total = await KunstView.getTotalFromSharedPref();
    print(score / total);
    return (score / total);
  }

  Future<double> getTvPercentageFuture() async {
    int score = await FernsehserienView.getScoreFromSharedPref();
    int total = await FernsehserienView.getTotalFromSharedPref();
    print(score / total);
    return (score / total);
  }

  Future<double> getMoviePercentageFuture() async {
    int score = await FilmeView.getScoreFromSharedPref();
    int total = await FilmeView.getTotalFromSharedPref();
    print(score / total);
    return (score / total);
  }
}
