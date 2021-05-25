import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ColorContants.dart';
import 'QuestionAndAnswerConstants.dart';
import 'RoutingConstants.dart';
import 'SizeConstants.dart';
import 'TextConstants.dart';

class SportView extends StatefulWidget {
  final sportQuestions = QuestionsAndAnswersConstants.SPORT.keys.toList();
  final sportAnswerMap = QuestionsAndAnswersConstants.SPORT.values;
  SportView({Key key}) : super(key: key);

  @override
  _SportViewState createState() => _SportViewState();

  static Future<int> getSportScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final sportScore = prefs.getInt("sportScore");
    if (sportScore == null) {
      return 0;
    }
    return sportScore;
  }

  static Future<int> getSportTotalFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final sportTotalQuestions = prefs.getInt("sportTotal");
    if (sportTotalQuestions == null) {
      return 0;
    }
    return sportTotalQuestions;
  }

  static Future<void> resetScoreAndTotal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("sportScore", 0);
    await prefs.setInt("sportTotal", 0);
  }

  Future<void> incrementScore() async {
    final prefs = await SharedPreferences.getInstance();
    int lastScore = await getSportScoreFromSharedPref();
    int currentScore = ++lastScore;
    await prefs.setInt("sportScore", currentScore);
  }

  Future<void> incrementTotal() async {
    final prefs = await SharedPreferences.getInstance();
    int lastTotal = await getSportTotalFromSharedPref();
    int currentTotal = ++lastTotal;
    await prefs.setInt("sportTotal", currentTotal);
  }

  void _getScore() async {
    int score = await getSportScoreFromSharedPref();
    print("Pref score: " + score.toString());
  }

  void _getTotal() async {
    int total = await getSportTotalFromSharedPref();
    print("Pref total: " + total.toString());
  }
}

class _SportViewState extends State<SportView> {
  int counter = 0;
  var scoreArray = [-3, -2, -1, 1];
  Color buttonColor1 = ColorConstants.ButtonColor;
  Color buttonColor2 = ColorConstants.ButtonColor;
  Color buttonColor3 = ColorConstants.ButtonColor;
  Color buttonColor4 = ColorConstants.ButtonColor;
  bool answerButtonsEnabled = true;
  bool nextQuestionButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.sports_soccer),
        centerTitle: true,
        title: Text(TextConstants.appBarSport),
      ),
      body: counter <= (widget.sportQuestions.length - 1)
          ? _displayQuestions()
          : _displayEndOfQuiz(context),
    );
  }

  SafeArea _displayQuestions() {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: SizeConstants.questionBoxHeight,
            width: SizeConstants.questionBoxWidth,
            margin: EdgeInsets.all(SizeConstants.questionBoxMargin),
            padding: EdgeInsets.all(SizeConstants.questionBoxPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConstants.borderRadius),
                color: ColorConstants.BoxColor),
            child: Center(
              child: Text(
                widget.sportQuestions[counter],
                style: TextStyle(
                    color: ColorConstants.TextColorWithinBox,
                    fontSize: SizeConstants.titleSize),
              ),
            ),
          ),
          SizedBox(
            height: SizeConstants.sizedBoxHeight,
          ),
          Container(
            height: SizeConstants.gridViewContainerHeight,
            margin: EdgeInsets.all(SizeConstants.gridViewContainerMargin),
            child: GridView.count(
              crossAxisCount: SizeConstants.gridViewCrossAxisCount,
              mainAxisSpacing: SizeConstants.gridViewMainAxisSpacing,
              crossAxisSpacing: SizeConstants.gridViewCrossAxisSpacing,
              childAspectRatio: SizeConstants.gridViewChildAspectRatio,
              children: [
                Container(
                  height: SizeConstants.buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return buttonColor1;
                          return buttonColor1;
                        },
                      ),
                    ),
                    onPressed: answerButtonsEnabled
                        ? () {
                            setState(() {
                              if (scoreArray[0].toString() == "1") {
                                widget.incrementScore();
                                print("correct answer");

                                buttonColor1 = Colors.green;
                              } else {
                                print("wrong answer");
                                buttonColor1 = Colors.red;
                              }
                              answerButtonsEnabled = false;
                            });
                            nextQuestionButtonEnabled = true;
                            widget.incrementTotal();
                          }
                        : null,
                    child: Text(
                        widget.sportAnswerMap
                            .elementAt(counter)[scoreArray[0]]
                            .toString(),
                        style: TextStyle(fontSize: SizeConstants.textSize)),
                  ),
                ),
                Container(
                  height: SizeConstants.buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return buttonColor2;
                          return buttonColor2;
                        },
                      ),
                    ),
                    onPressed: answerButtonsEnabled
                        ? () {
                            setState(() {
                              if (scoreArray[1].toString() == "1") {
                                widget.incrementScore();
                                print("correct answer");
                                buttonColor2 = Colors.green;
                              } else {
                                print("wrong answer");
                                buttonColor2 = Colors.red;
                              }
                              answerButtonsEnabled = false;
                            });
                            nextQuestionButtonEnabled = true;
                            widget.incrementTotal();
                          }
                        : null,
                    child: Text(
                        widget.sportAnswerMap
                            .elementAt(counter)[scoreArray[1]]
                            .toString(),
                        style: TextStyle(fontSize: SizeConstants.textSize)),
                  ),
                ),
                Container(
                  height: SizeConstants.buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return buttonColor3;
                          return buttonColor3;
                        },
                      ),
                    ),
                    onPressed: answerButtonsEnabled
                        ? () {
                            setState(() {
                              if (scoreArray[2].toString() == "1") {
                                widget.incrementScore();
                                print("correct answer");
                                buttonColor3 = Colors.green;
                              } else {
                                print("wrong answer");
                                buttonColor3 = Colors.red;
                              }
                              answerButtonsEnabled = false;
                            });
                            nextQuestionButtonEnabled = true;
                            widget.incrementTotal();
                          }
                        : null,
                    child: Text(
                        widget.sportAnswerMap
                            .elementAt(counter)[scoreArray[2]]
                            .toString(),
                        style: TextStyle(fontSize: SizeConstants.textSize)),
                  ),
                ),
                Container(
                  height: SizeConstants.buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return buttonColor4;
                          return buttonColor4;
                        },
                      ),
                    ),
                    onPressed: answerButtonsEnabled
                        ? () {
                            setState(() {
                              if (scoreArray[3].toString() == "1") {
                                widget.incrementScore();
                                buttonColor4 = Colors.green;
                                print("correct answer");
                              } else {
                                print("wrong answer");
                                buttonColor4 = Colors.red;
                              }
                              answerButtonsEnabled = false;
                            });
                            nextQuestionButtonEnabled = true;
                            widget.incrementTotal();
                          }
                        : null,
                    child: Text(
                        widget.sportAnswerMap
                            .elementAt(counter)[scoreArray[3]]
                            .toString(),
                        style: TextStyle(fontSize: SizeConstants.textSize)),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return ColorConstants.ButtonColor;
                  return ColorConstants.ButtonColor;
                },
              ),
            ),
            onPressed: nextQuestionButtonEnabled
                ? () {
                    setState(() {
                      scoreArray.shuffle();
                      counter += 1;
                      buttonColor1 = ColorConstants.ButtonColor;
                      buttonColor2 = ColorConstants.ButtonColor;
                      buttonColor3 = ColorConstants.ButtonColor;
                      buttonColor4 = ColorConstants.ButtonColor;
                      answerButtonsEnabled = true;
                      nextQuestionButtonEnabled = false;
                      widget._getScore();
                      widget._getTotal();
                    });
                  }
                : null,
            child: Text("nächste Frage",
                style: TextStyle(fontSize: SizeConstants.textSize)),
          ),
        ],
      ),
    );
  }

  SafeArea _displayEndOfQuiz(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: SizeConstants.questionBoxHeight,
            width: SizeConstants.questionBoxWidth,
            margin: EdgeInsets.all(SizeConstants.questionBoxMargin),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConstants.borderRadius),
                color: ColorConstants.BoxColor),
            child: Center(
                child: Text(TextConstants.endOfQuiz,
                    style: TextStyle(
                      fontSize: SizeConstants.textSize,
                      color: ColorConstants.TextColorWithinBox,
                    ))),
          ),
          SizedBox(
            height: SizeConstants.sizedBoxHeight,
          ),
          ElevatedButton(
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
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutingConstants.MainViewRoute, (route) => false);
            },
            child: Text(TextConstants.endOfQuizButtonText,
                style: TextStyle(
                    fontSize: SizeConstants.textSize,
                    color: ColorConstants.TextColorWithinBox)),
          ),
        ],
      ),
    );
  }
}
