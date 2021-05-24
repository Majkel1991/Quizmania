import 'package:flutter/material.dart';
import 'RoutingConstants.dart';
import 'TextConstants.dart';

import 'ColorContants.dart';
import 'SizeConstants.dart';
import 'package:quizmania/QuestionAndAnswerConstants.dart';

class GeografieView extends StatefulWidget {
  final geographyQuestions =
      QuestionsAndAnswersConstants.GEOGRAPHY.keys.toList();
  final geographyAnswersMap = QuestionsAndAnswersConstants.GEOGRAPHY.values;

  GeografieView({Key key}) : super(key: key);

  @override
  _GeografieViewState createState() => _GeografieViewState();
}

class _GeografieViewState extends State<GeografieView> {
  int counter = 0;
  int score = 0;
  var scoreArray = [-3, -2, -1, 1];
  Color buttonColor1 = ColorConstants.ButtonColor;
  Color buttonColor2 = ColorConstants.ButtonColor;
  Color buttonColor3 = ColorConstants.ButtonColor;
  Color buttonColor4 = ColorConstants.ButtonColor;
  bool isEnabled = true;
  @override
  Widget build(BuildContext context) {
    print(widget.geographyAnswersMap.toString());
    print(counter);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.public),
        centerTitle: true,
        title: Text(TextConstants.appBarGeografie),
      ),
      body: counter <= (widget.geographyQuestions.length - 1)
          ? SafeArea(
              child: Column(
                children: [
                  Container(
                    height: SizeConstants.questionBoxHeight,
                    width: SizeConstants.questionBoxWidth,
                    margin: EdgeInsets.all(SizeConstants.questionBoxMargin),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConstants.borderRadius),
                        color: ColorConstants.BoxColor),
                    child:
                        Center(child: Text(widget.geographyQuestions[counter])),
                  ),
                  SizedBox(
                    height: SizeConstants.sizedBoxHeight,
                  ),
                  Container(
                    height: SizeConstants.gridViewContainerHeight,
                    margin:
                        EdgeInsets.all(SizeConstants.gridViewContainerMargin),
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
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return buttonColor1;
                                  return buttonColor1;
                                },
                              ),
                            ),
                            onPressed: isEnabled
                                ? () {
                                    setState(() {
                                      if (scoreArray[0].toString() == "1") {
                                        score += 1;
                                        print("correct answer");
                                        buttonColor1 = Colors.green;
                                      } else {
                                        print("wrong answer");
                                        buttonColor1 = Colors.red;
                                      }
                                      isEnabled = false;
                                    });
                                  }
                                : null,
                            child: Text(widget.geographyAnswersMap
                                .elementAt(counter)[scoreArray[0]]
                                .toString()),
                          ),
                        ),
                        Container(
                          height: SizeConstants.buttonHeight,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return buttonColor2;
                                  return buttonColor2;
                                },
                              ),
                            ),
                            onPressed: isEnabled
                                ? () {
                                    setState(() {
                                      if (scoreArray[1].toString() == "1") {
                                        score += 1;
                                        print("correct answer");
                                        buttonColor2 = Colors.green;
                                      } else {
                                        print("wrong answer");
                                        buttonColor2 = Colors.red;
                                      }
                                      isEnabled = false;
                                    });
                                  }
                                : null,
                            child: Text(widget.geographyAnswersMap
                                .elementAt(counter)[scoreArray[1]]
                                .toString()),
                          ),
                        ),
                        Container(
                          height: SizeConstants.buttonHeight,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return buttonColor3;
                                  return buttonColor3;
                                },
                              ),
                            ),
                            onPressed: isEnabled
                                ? () {
                                    setState(() {
                                      if (scoreArray[2].toString() == "1") {
                                        score += 1;
                                        print("correct answer");
                                        buttonColor3 = Colors.green;
                                      } else {
                                        print("wrong answer");
                                        buttonColor3 = Colors.red;
                                      }
                                      isEnabled = false;
                                    });
                                  }
                                : null,
                            child: Text(widget.geographyAnswersMap
                                .elementAt(counter)[scoreArray[2]]
                                .toString()),
                          ),
                        ),
                        Container(
                          height: SizeConstants.buttonHeight,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return buttonColor4;
                                  return buttonColor4;
                                },
                              ),
                            ),
                            onPressed: isEnabled
                                ? () {
                                    setState(() {
                                      if (scoreArray[3].toString() == "1") {
                                        score += 1;
                                        buttonColor4 = Colors.green;
                                        print("correct answer");
                                      } else {
                                        print("wrong answer");
                                        buttonColor4 = Colors.red;
                                      }
                                      isEnabled = false;
                                    });
                                  }
                                : null,
                            child: Text(widget.geographyAnswersMap
                                .elementAt(counter)[scoreArray[3]]
                                .toString()),
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
                    onPressed: () {
                      setState(() {
                        scoreArray.shuffle();
                        counter += 1;
                        buttonColor1 = ColorConstants.ButtonColor;
                        buttonColor2 = ColorConstants.ButtonColor;
                        buttonColor3 = ColorConstants.ButtonColor;
                        buttonColor4 = ColorConstants.ButtonColor;
                        isEnabled = true;
                      });
                    },
                    child: Text("nächste Frage"),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  Container(
                    height: SizeConstants.questionBoxHeight,
                    width: SizeConstants.questionBoxWidth,
                    margin: EdgeInsets.all(SizeConstants.questionBoxMargin),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConstants.borderRadius),
                        color: ColorConstants.BoxColor),
                    child: Center(child: Text(TextConstants.endOfQuiz)),
                  ),
                  SizedBox(
                    height: SizeConstants.sizedBoxHeight,
                  ),
                  Container(
                    height: SizeConstants.backToMainButtonHeight,
                    width: SizeConstants.backToMainButtonWidth,
                    margin:
                        EdgeInsets.all(SizeConstants.backToMainButtonMargin),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
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
                      child: Text(TextConstants.endOfQuizButtonText),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
