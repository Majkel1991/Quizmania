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
                                    return ColorConstants.ButtonColor;
                                  return ColorConstants.ButtonColor;
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (scoreArray[0].toString() == "1") {
                                  score += 1;
                                  print("correct answer");
                                }
                                scoreArray.shuffle();
                                counter += 1;
                              });
                            },
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
                                    return ColorConstants.ButtonColor;
                                  return ColorConstants.ButtonColor;
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (scoreArray[1].toString() == "1") {
                                  score += 1;
                                  print("correct answer");
                                }
                                scoreArray.shuffle();
                                counter += 1;
                              });
                            },
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
                                    return ColorConstants.ButtonColor;
                                  return ColorConstants.ButtonColor;
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (scoreArray[2].toString() == "1") {
                                  score += 1;
                                  print("correct answer");
                                }
                                scoreArray.shuffle();
                                counter += 1;
                              });
                            },
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
                                    return ColorConstants.ButtonColor;
                                  return ColorConstants.ButtonColor;
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (scoreArray[3].toString() == "1") {
                                  score += 1;
                                  print("correct answer");
                                }
                                scoreArray.shuffle();
                                counter += 1;
                              });
                            },
                            child: Text(widget.geographyAnswersMap
                                .elementAt(counter)[scoreArray[3]]
                                .toString()),
                          ),
                        ),
                      ],
                    ),
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
