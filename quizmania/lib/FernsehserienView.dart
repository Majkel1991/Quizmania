import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ColorContants.dart';
import 'QuestionAndAnswerConstants.dart';
import 'RoutingConstants.dart';
import 'SizeConstants.dart';
import 'TextConstants.dart';

class FernsehserienView extends StatefulWidget {
  final tvQuestions = QuestionsAndAnswersConstants.TV.keys.toList();
  final tvAnswersMap = QuestionsAndAnswersConstants.TV.values;
  FernsehserienView({Key key}) : super(key: key);

  @override
  _FernsehserienViewState createState() => _FernsehserienViewState();

  static Future<int> getScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final tvScore = prefs.getInt("tvScore");
    if (tvScore == null) {
      return 0;
    }
    return tvScore;
  }

  static Future<int> getTotalFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final tvTotalQuestions = prefs.getInt("tvTotal");
    if (tvTotalQuestions == null) {
      return 0;
    }
    return tvTotalQuestions;
  }

  static Future<void> resetScoreAndTotal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("tvScore", 0);
    await prefs.setInt("tvTotal", 0);
  }

  Future<void> incrementScore() async {
    final prefs = await SharedPreferences.getInstance();
    int lastScore = await getScoreFromSharedPref();
    int currentScore = ++lastScore;
    await prefs.setInt("tvScore", currentScore);
  }

  Future<void> incrementTotal() async {
    final prefs = await SharedPreferences.getInstance();
    int lastTotal = await getTotalFromSharedPref();
    int currentTotal = ++lastTotal;
    await prefs.setInt("tvTotal", currentTotal);
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

class _FernsehserienViewState extends State<FernsehserienView> {
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
        leading: Icon(Icons.tv),
        centerTitle: true,
        title: Text(TextConstants.appBarTV),
      ),
      body: counter <= (widget.tvQuestions.length - 1)
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
                widget.tvQuestions[counter],
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
                        widget.tvAnswersMap
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
                        widget.tvAnswersMap
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
                        widget.tvAnswersMap
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
                        widget.tvAnswersMap
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
