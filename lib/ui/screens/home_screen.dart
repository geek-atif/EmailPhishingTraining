import 'package:flutter/services.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../controller/server_update_controller.dart';
import '../../utiles/constant.dart';
import '../../utiles/utility.dart';
import '../routers/my_router.dart';
import '../styles/my_app_theme.dart';
import '../widgets/loading.dart';
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
  var isWordGameDone = false;
  var isRolePlayGameDone = false;
  var isPhishingScore = false;
  var isTutortialOfficeDone = false;
  var isPhishingFactDone = false;

  late List<ChartData> gameScoreChart = List.empty(growable: true);
  late List<ChartData> quizScoreChart = List.empty(growable: true);
  final ServerUpdateController _serverUpdateController =
      Get.put(ServerUpdateController());
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  void loadData() {
    _serverUpdateController.getUserReport();
  }

  void loadScore() {
    print("loadScore()");
    loadGameScore();
    loadQuizScore();
  }

  @override
  void didChangeDependencies() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.didChangeDependencies();
    loadData();
    loadScore();
  }

  @override
  Widget build(BuildContext context) {
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
            child: homeContiner(),
          ),

          //homeContiner(screenSize),
          splashColor: Colors.white,
        ),
      ),
    );
  }

  SizedBox homeContiner() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 0,
              child: LightTextSubHead(data: "Your Score"),
            ),
            Obx(
              () => _serverUpdateController.isLoading.value
                  ? const Loading(
                      loadingMessage: '',
                    )
                  : Expanded(
                      flex: 3,
                      child: scoreCard(
                        _serverUpdateController.quizReadinessUser,
                      ),
                    ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: Get.height * 0.02,
              ),
            ),
            Expanded(
              flex: 6,
              child: actionCard(),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Row scoreCard(List<ChartData> quizReadinessUser) {
    return Row(
      children: [
        displayGraphScore("Game", gameScoreChart, gameScore[GAME_TOTAL]),
        displayGraphScore("Quiz", quizReadinessUser, quizScore[QUIZ_TOTAL]),
      ],
    );
  }

  Expanded displayGraphScore(
      String title, List<ChartData> totalScore, double maxValue) {
    print("displayGraphScore title ${title} maxValue ${maxValue} ");
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SfCircularChart(
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  widget: LightTextSubHead(
                    data: "${totalScore.first.y.abs()} %",
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
                    maximumValue: 100,
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
    );
  }

  Card actionCard() {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(10.0),
      color: MyAppTheme.whitehaxdialog,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: LightTextSubHead(data: "Tutorials, Quizzes, Games"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: actionOne(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: actionTwo(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: actionThree(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row actionOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => Get.toNamed(MyRouter.phishingStepOne),
            child: myCard(isPhishingScore, "3-Steps Detect", Icons.read_more),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => Get.toNamed(MyRouter.officePhishingOne),
            child: myCard(
                isTutortialOfficeDone, "Office365 Risks", Icons.read_more),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => Get.toNamed(MyRouter.phishingFactsFirstScreen),
            child:
                myCard(isPhishingFactDone, "Phishing Facts", Icons.read_more),
          ),
        ),
      ],
    );
  }

  Row actionTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () =>
                Get.toNamed(MyRouter.quizScreen, arguments: "phishingQuiz"),
            child: myCard(isQuizScore, "Quizz", Icons.quiz_outlined),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => Get.toNamed(MyRouter.wordGameScreen),
            child: myCard(isWordGameDone, "Word Scrabble", Icons.games),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => Get.toNamed(
              MyRouter.rolePlaySubHome,
            ),
            child: myCard(isRolePlayGameDone, "Role Play", Icons.games),
          ),
        ),
      ],
    );
  }

  Card myCard(bool isDone, String title, IconData iconDat) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      color: MyAppTheme.whitehaxBoxSmall,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 0,
            child: SizedBox(
              height: Get.height * 0.011,
            ),
          ),
          isDone
              ? Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconDat,
                      size: 30,
                      color: MyAppTheme.whitehaxButtonColor,
                    ),
                  ),
                )
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconDat,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
          isDone
              ? Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlueTextBody(data: title),
                  ),
                )
              : Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DarkTextBody(data: title),
                  ),
                ),
        ],
      ),
    );
  }

  void loadGameScore() {
    gameScore = Utility.getGameScore();
    gameScoreChart.add(ChartData("Game", gameScore[GAME_TOTAL_PRE]));
    print("loadGameScore() gameScoreChart ${gameScoreChart.length}");
    isWordGameDone = Utility.getBolValue(GAME_WORD_DONE);
    isRolePlayGameDone = Utility.getBolValue(GAME_ROLE_PLAY_DONE);
    print(
        "loadGameScore() isWordGameDone ${isWordGameDone}  isRolePlayGameDone ${isRolePlayGameDone}");
  }

  void loadQuizScore() {
    print("loadGameScore() gameScoreChart ${gameScoreChart.length}");
    quizScore = Utility.getQuizScore();
    quizScoreChart.add(ChartData("Quiz", quizScore[QUIZ_TOTAL_PRE]));
    print("loadScore() quizScoreChart ${quizScoreChart.length}");

    isQuizScore = Utility.getBolValue(Quiz_PHISHING_DONE);
    isPhishingScore = Utility.getBolValue(TUTORIAL_STEP_ATTEMPT_Done);
    isTutortialOfficeDone = Utility.getBolValue(TUTORIAL_OFFICE_DONE);
    isPhishingFactDone = Utility.getBolValue(TUTORIAL_PHISHING_FACT_Done);
  }

  actionThree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => Get.toNamed(
              MyRouter.myWebView,
            ),
            child: myCard(false, "Puzzle", Icons.games),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(""),
        ),
        Expanded(
          flex: 2,
          child: Text(""),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
