import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/ColorContants.dart';
import '../Constants/QuestionAndAnswerConstants.dart';
import '../Constants/RoutingConstants.dart';
import '../Constants/SizeConstants.dart';
import '../Constants/TextConstants.dart';

class KunstView extends StatefulWidget {
  final artQuestions = QuestionsAndAnswersConstants.ART.keys.toList();
  final artAnswersMap = QuestionsAndAnswersConstants.ART.values;
  KunstView({Key key}) : super(key: key);

  @override
  _KunstViewState createState() => _KunstViewState();
  static Future<int> getScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final artScore = prefs.getInt("artScore");
    if (artScore == null) {
      return 0;
    }
    return artScore;
  }

  static Future<int> getTotalFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final artTotalQuestions = prefs.getInt("artTotal");
    if (artTotalQuestions == null) {
      return 0;
    }
    return artTotalQuestions;
  }

  static Future<void> resetScoreAndTotal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("artScore", 0);
    await prefs.setInt("artTotal", 0);
  }

  Future<void> incrementScore() async {
    final prefs = await SharedPreferences.getInstance();
    int lastScore = await getScoreFromSharedPref();
    int currentScore = ++lastScore;
    await prefs.setInt("artScore", currentScore);
  }

  Future<void> incrementTotal() async {
    final prefs = await SharedPreferences.getInstance();
    int lastTotal = await getTotalFromSharedPref();
    int currentTotal = ++lastTotal;
    await prefs.setInt("artTotal", currentTotal);
  }

  void _getScore() async {
    int score = await getScoreFromSharedPref();
    print("Pref score: " + score.toString());
  }

  void _getTotal() async {
    int total = await getTotalFromSharedPref();
    print("Pref total: " + total.toString());
  }
}

class _KunstViewState extends State<KunstView> {
  int counter = 0;
  var scoreArray = [-3, -2, -1, 1];
  Color buttonColor1 = ColorConstants.buttonColor;
  Color buttonColor2 = ColorConstants.buttonColor;
  Color buttonColor3 = ColorConstants.buttonColor;
  Color buttonColor4 = ColorConstants.buttonColor;
  bool answerButtonsEnabled = true;
  bool nextQuestionButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.palette_outlined),
        centerTitle: true,
        title: Text(TextConstants.appBarArt),
      ),
      body: counter <= (widget.artQuestions.length - 1)
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
                color: ColorConstants.boxColor),
            child: Center(
              child: Text(
                widget.artQuestions[counter],
                style: TextStyle(
                    color: ColorConstants.textColorWithinBox,
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
                        widget.artAnswersMap
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
                        widget.artAnswersMap
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
                        widget.artAnswersMap
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
                        widget.artAnswersMap
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
                    return ColorConstants.buttonColor;
                  return ColorConstants.buttonColor;
                },
              ),
            ),
            onPressed: nextQuestionButtonEnabled
                ? () {
                    setState(() {
                      scoreArray.shuffle();
                      counter += 1;
                      buttonColor1 = ColorConstants.buttonColor;
                      buttonColor2 = ColorConstants.buttonColor;
                      buttonColor3 = ColorConstants.buttonColor;
                      buttonColor4 = ColorConstants.buttonColor;
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
                color: ColorConstants.boxColor),
            child: Center(
                child: Text(TextConstants.endOfQuiz,
                    style: TextStyle(
                      fontSize: SizeConstants.textSize,
                      color: ColorConstants.textColorWithinBox,
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
                    return ColorConstants.buttonColor;
                  return ColorConstants.buttonColor;
                },
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutingConstants.mainViewRoute, (route) => false);
            },
            child: Text(TextConstants.endOfQuizButtonText,
                style: TextStyle(
                    fontSize: SizeConstants.textSize,
                    color: ColorConstants.textColorWithinBox)),
          ),
        ],
      ),
    );
  }
}
