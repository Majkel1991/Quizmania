import 'package:flutter/material.dart';
import 'package:quizmania/Routing/routeGenerator.dart';
import 'Constants/textConstants.dart';
import 'Constants/ColorContants.dart';
import 'Constants/RoutingConstants.dart';
import 'Constants/SizeConstants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: ColorConstants.AppbarColor,
      ),
      initialRoute: RoutingConstants.MainViewRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MainView extends StatelessWidget {
  final topicIcons = [
    Icons.public,
    Icons.sports_soccer,
    Icons.history,
    Icons.auto_stories,
    Icons.palette_outlined,
    Icons.tv,
    Icons.movie
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(TextConstants.appBarMain))),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: SizeConstants.topicBoxHeight,
              width: SizeConstants.topicBoxWidth,
              margin: EdgeInsets.all(SizeConstants.topicBoxMargin),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConstants.borderRadius),
                  color: ColorConstants.BoxColor),
              child: Center(
                child: Text(
                  TextConstants.topicTitle,
                  style: TextStyle(
                      fontSize: SizeConstants.titleSize,
                      color: ColorConstants.TextColorWithinBox),
                ),
              ),
            ),
            Container(
              height: SizeConstants.mainListViewHeight,
              child: ListView.builder(
                itemCount: TextConstants.topics.length,
                itemBuilder: (context, index) {
                  String navigationText = TextConstants.topics[index] + "View";
                  print(navigationText);
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(navigationText);
                      },
                      child: ListTile(
                          leading: Icon(topicIcons[index]),
                          title: Text(TextConstants.topics[index])),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: SizeConstants.buttonHeight,
              width: SizeConstants.buttonWidth,
              padding: EdgeInsets.all(SizeConstants.buttonPadding),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return ColorConstants.ButtonColor;
                      return ColorConstants
                          .ButtonColor; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("ScoreboardView");
                },
                child: Text("Zum Scoreboard"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
