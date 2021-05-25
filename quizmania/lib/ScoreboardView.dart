import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'ColorContants.dart';
import 'GeografieView.dart';
import 'SizeConstants.dart';
import 'TextConstants.dart';

class ScoreboardView extends StatefulWidget {
  ScoreboardView({Key key}) : super(key: key);

  @override
  _ScoreboardViewState createState() => _ScoreboardViewState();
}

class _ScoreboardViewState extends State<ScoreboardView> {
  Future<int> geographyScoreFuture = GeografieView.getScoreFromSharedPref();
  Future<int> geographyTotalFuture = GeografieView.getTotalFromSharedPref();

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
          ],
        ),
      ),
    );
  }

  FutureBuilder<double> getFutureBuilder({Future future, String header}) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
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
          center: Text((snapshot.data * 100).toStringAsFixed(2) + "%"),
          progressColor: ColorConstants.BoxColor,
          animation: true,
          animationDuration: SizeConstants.scoreboardAnimationDuration,
        );
      },
    );
  }

  Future<double> getGeographyPercentageFuture() async {
    int geoScore = await GeografieView.getScoreFromSharedPref();
    int geoTotal = await GeografieView.getTotalFromSharedPref();
    print(geoScore / geoTotal);
    return (geoScore / geoTotal);
  }
}
