import 'package:flutter/services.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../utiles/constant.dart';
import '../../utiles/utility.dart';
import '../routers/my_router.dart';
import '../styles/my_app_theme.dart';
import '../widgets/navigationmenu/my_navigation_menu.dart';
import 'package:flutter/material.dart';
import '../widgets/text/blue_text_body.dart';
import '../widgets/text/dark_text_body.dart';
import '../widgets/text/light_text_body.dart';
import '../widgets/text/light_text_sub_head.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> keyLoader = GlobalKey<SliderDrawerState>();
  var gameScore;
  var quizScore;

  var isQuizScore = false;
  var isGameScore = false;
  var isPhishingScore = false;

  late List<ChartData> gameScoreChart = List.empty(growable: true);
  late List<ChartData> quizScoreChart = List.empty(growable: true);
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    loadScore();
    super.initState();
  }

  void loadScore() {
    print("loadScore()");
    gameScore = Utility.getGameScore();
    quizScore = Utility.getQuizScore();
    gameScoreChart.add(ChartData("Word Game", gameScore["GAME_WORD_ATTEMPT"]));
    print("loadScore() gameScoreChart ${gameScoreChart.length}");
    quizScoreChart
        .add(ChartData("Quiz Game", quizScore["QUIZ_PHISHING_ATTEMPT"]));
    print("loadScore() quizScoreChart ${quizScoreChart.length}");

    isQuizScore = Utility.getBolValue(Quiz_PHISHING_DONE);
    isGameScore = Utility.getBolValue(GAME_WORD_DONE);
    isPhishingScore = Utility.getBolValue(TUTORIAL_STEP_ATTEMPT_Done);
  }

  @override
  void didChangeDependencies() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: const SliderAppBar(
            appBarColor: MyAppTheme.whitehaxBackgroundColor,
            title: LightTextSubHead(
              data: "Whitehax Phishsim",
            ),
            drawerIconColor: Colors.white,
            appBarPadding: EdgeInsets.all(4),
            appBarHeight: 65,
          ),
          key: keyLoader,
          slider: const MyNavigationMenu(),
          child: SingleChildScrollView(
            child: homeContiner(screenSize),
          ),

          //homeContiner(screenSize),
          splashColor: Colors.white,
        ),
      ),
    );
  }

  Container homeContiner(Size screenSize) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            const LightTextSubHead(data: "Your Score"),
            scoreCard(screenSize),
            actionCard(screenSize),
          ],
        ),
      ),
    );
  }

  Card actionCard(Size screenSize) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(10.0),
      color: MyAppTheme.whitehaxdialog,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2),
              child: LightTextSubHead(data: "Tutorial , Quiz , Game"),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.officePhishingOne),
                  child:
                      myCard(screenSize, false, "office 365", Icons.read_more),
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.phishingStepOne),
                  child: myCard(screenSize, isPhishingScore, "3 Step\nPhishing",
                      Icons.read_more),
                ),
                InkWell(
                  onTap: () => Get.toNamed(MyRouter.quizScreen,
                      arguments: "phishingQuiz"),
                  child: myCard(
                      screenSize, isQuizScore, "Phishing", Icons.quiz_outlined),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Get.toNamed(MyRouter.wordGameScreen),
                    child: myCard(screenSize, isGameScore, "Word", Icons.games),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Get.toNamed(MyRouter.emailPhishingScreen,
                        arguments: "phishingEmailGame"),
                    child:
                        myCard(screenSize, isGameScore, "Email", Icons.games),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row scoreCard(Size screenSize) {
    return Row(
      children: [
        displayGraphScore(
            screenSize, "Game", gameScoreChart, gameScore["GAME_WORD_TOTAL"]),
        displayGraphScore(screenSize, "Quiz", quizScoreChart,
            quizScore["QUIZ_PHISHING_TOTAL"]),
      ],
    );
  }

  SizedBox myCard(
      Size screenSize, bool isDone, String title, IconData iconDat) {
    return SizedBox(
      height: screenSize.height * 0.125,
      width: screenSize.width * 0.25,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: MyAppTheme.whitehaxBoxSmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenSize.height * 0.011,
            ),
            isDone
                ? Icon(
                    iconDat,
                    size: 30,
                    color: MyAppTheme.whitehaxButtonColor,
                  )
                : Icon(
                    iconDat,
                    size: 30,
                    color: Colors.black,
                  ),
            isDone
                ? Flexible(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: BlueTextBody(data: title),
                      ),
                    ),
                  )
                : Flexible(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: DarkTextBody(data: title),
                      ),
                    ),
                  ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.only(left: 10.0),
            //       child: Icon(
            //         Icons.read_more,
            //         size: 40,
            //         color: Colors.black,
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(8.0),
            //       child: Container(
            //         height: 10,
            //         width: 10,
            //         decoration: const BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: MyAppTheme.whitehaxSubColor,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Flexible displayGraphScore(Size screenSize, String title,
      List<ChartData> totalScore, double maxValue) {
    print("displayGraphScore title ${title} maxValue ${maxValue} ");
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: screenSize.height * 0.25,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(8), // radius of 10
          //   color: MyAppTheme.whitehaxSubColor, // green as background color
          // ),
          // padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: SfCircularChart(
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget: LightTextSubHead(
                        data: "${totalScore.first.y.abs()}",
                      ),
                    ),
                  ],
                  series: <CircularSeries>[
                    // Renders radial bar chart
                    RadialBarSeries<ChartData, String>(
                        dataSource: totalScore,
                        sortingOrder: SortingOrder.ascending,
                        useSeriesColor: true,
                        trackOpacity: 0.3,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        radius: '80%',
                        innerRadius: '80%',
                        cornerStyle: CornerStyle.endCurve,
                        gap: '3%',
                        maximumValue: maxValue,
                        // dataLabelSettings: const DataLabelSettings(
                        //     // Renders the data label
                        //     isVisible: true),
                        animationDelay: 2.0,
                        strokeWidth: 0.2,
                        trackBorderWidth: 1.0),
                  ],
                ),
              ),
              LightTextBody(data: title),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}


 // SizedBox(
                    //   height: screenSize.height * 0.01,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 2),
                    //   child: LightTextSubHead(data: "Tutorial"),
                    // ),
                    // Row(
                    //   children: [
                    //     myCard(
                    //         screenSize, false, "office 365", Icons.read_more),
                    //     SizedBox(
                    //       width: screenSize.width * 0.01,
                    //     ),
                    //     InkWell(
                    //       onTap: () => Get.toNamed(MyRouter.phishingStepOne),
                    //       child: myCard(screenSize, isPhishingScore,
                    //           "3 Step\nPhishing", Icons.read_more),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: screenSize.height * 0.012,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 2),
                    //   child: LightTextSubHead(data: "Quiz"),
                    // ),
                    // Row(
                    //   children: [
                    //     InkWell(
                    //       onTap: () => Get.toNamed(MyRouter.quizScreen,
                    //           arguments: "phishingQuiz"),
                    //       child: myCard(screenSize, isQuizScore, "Phishing",
                    //           Icons.quiz_outlined),
                    //     ),
                    //     SizedBox(
                    //       width: screenSize.width * 0.01,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: screenSize.height * 0.012,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 2),
                    //   child: LightTextSubHead(data: "Game"),
                    // ),
                    // Row(
                    //   children: [
                    //     InkWell(
                    //         onTap: () => Get.toNamed(MyRouter.wordGameScreen),
                    //         child: myCard(
                    //             screenSize, isGameScore, "Word", Icons.games)),
                    //     SizedBox(
                    //       width: screenSize.width * 0.01,
                    //     ),
                    //   ],
                    // )