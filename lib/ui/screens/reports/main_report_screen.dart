import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../ui/styles/my_app_theme.dart';
import '../../../ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles/fonts.dart';
import '../../widgets/text/dark_text_body.dart';
import '../../widgets/text/light_text_body.dart';
import '../../widgets/text/light_text_sub_head.dart';
import '../home_screen.dart';

class MainReportScreen extends StatefulWidget {
  const MainReportScreen({super.key});

  @override
  State<MainReportScreen> createState() => _MainReportScreenState();
}

class _MainReportScreenState extends State<MainReportScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<ChartData> phishingReadiness = List.empty(growable: true);
  late List<ChartData> phishingTutorialReadiness = List.empty(growable: true);
  late List<ChartData> phishingQuizReadiness = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    loadData();
  }

  void loadData() {
    phishingReadiness.add(ChartData("Game", 38));
    phishingTutorialReadiness.add(ChartData("Game", 37));
    phishingQuizReadiness.add(ChartData("Game", 66));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(),
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: homeContiner(),
        ),
      ),
    );
  }

  Padding homeContiner() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.size.height * 0.5,
            child: readinessScoreCard(),
          ),
          SizedBox(
            height: Get.size.height * 0.8,
            child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: phishingSimulationReadiness()),
          ),
        ],
      ),
    );
  }

  Card readinessScoreCard() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: LightTextSubHead(data: "Readiness"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: actionOne(),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: actionTwo(),
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
          flex: 4,
          child: myCard("Phishing", phishingReadiness),
        ),
        Expanded(
          flex: 4,
          child: myCard("Phishing Tutorial", phishingTutorialReadiness),
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
          flex: 3,
          child: myCard("Phishing Quiz", phishingQuizReadiness),
        ),
        Expanded(
          flex: 3,
          child: Text(""),
        ),
      ],
    );
  }

  Card myCard(String title, List<ChartData> totalScore) {
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
          Expanded(
            flex: 4,
            child: SfCircularChart(
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  widget: DarkTextBody(
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
          Expanded(
            flex: 1,
            child: DarkTextBody(data: title),
          ),
        ],
      ),
    );
  }

  Card phishingSimulationReadiness() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: LightTextSubHead(data: "Phishing Simulation Readiness"),
            ),
            SizedBox(
              height: 5,
            ),
            phishingSimCard("Social Network", "13", 0.53, "Medium", "53",
                MyAppTheme.whitehaxReportYellow),
            SizedBox(
              height: 5,
            ),
            phishingSimCard("Shipment/Products", "36", 0.36, "Medium", "36",
                MyAppTheme.whitehaxReportError),
            SizedBox(
              height: 5,
            ),
            phishingSimCard("Banking/Government", "57", 0.36, "Medium", "36",
                MyAppTheme.whitehaxReportYellow),
            SizedBox(
              height: 5,
            ),
            phishingSimCard("Microsoft 365 phishing scams", "12", 0.29, "High",
                "29", MyAppTheme.whitehaxReportError),
            SizedBox(
              height: 5,
            ),
            phishingSimCard("Foreign Benefit Scams", "25", 0.53, "High", "38",
                MyAppTheme.whitehaxReportYellow),
            SizedBox(
              height: 5,
            ),
            phishingSimCard("Business/Corp Scams", "25", 0.25, "High", "38",
                MyAppTheme.whitehaxReportError),
            SizedBox(
              height: 5,
            ),
            phishingSimCard("Social Network", "13", 0.53, "Medium", "38",
                MyAppTheme.whitehaxReportError),
          ],
        ),
      ),
    );
  }

  Container phishingSimCard(String title, String visisted, double percent_,
      String status, String percentStr, Color color_) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: LightTextBody(data: visisted),
          backgroundColor: color_,
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black,
              fontFamily: Fonts.poppins,
            ),
          ),
        ),
        trailing: Container(
          width: Get.size.width * 0.16,
          height: Get.size.height * 0.04,
          padding: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: color_,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(child: LightTextBody(data: status)),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: LinearPercentIndicator(
            width: Get.size.width * 0.35,
            lineHeight: Get.size.height * 0.025,
            percent: percent_,
            alignment: MainAxisAlignment.start,
            animation: true,
            //curve: Curves.bounceOut,
            backgroundColor: Colors.grey.shade300,
            progressColor: color_,
            barRadius: const Radius.circular(10),
            center: Text("${percentStr}%"),
          ),
        ),
      ),
    );
  }
}
