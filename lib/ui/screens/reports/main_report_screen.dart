import '../../../ui/widgets/text/light_text_head.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../controller/server_update_controller.dart';
import '../../../model/user_report.dart';
import '../../../ui/styles/my_app_theme.dart';
import '../../../ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles/fonts.dart';
import '../../widgets/loading.dart';
import '../../widgets/report/simulation_readiness.dart';
import '../../widgets/text/dark_text_body.dart';
import '../../widgets/text/light_text_body.dart';
import '../../widgets/text/light_text_body_sub.dart';
import '../../widgets/text/light_text_sub_eigh_head.dart';
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
  final ServerUpdateController _serverUpdateController =
      Get.put(ServerUpdateController());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    loadData();
  }

  void loadData() {
    _serverUpdateController.getUserReport_();
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
        body: Obx(
          () => _serverUpdateController.isLoading_.value
              ? const Loading(
                  loadingMessage: '',
                )
              : SingleChildScrollView(
                  child: homeContiner(_serverUpdateController.userInfo.value),
                ),
        ),
      ),
    );
  }

  Padding homeContiner(UserInfo userInfo) {
    print("homeContiner() ${userInfo.userName}");
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Center(
            child: LightTextHead(data: userInfo.userName),
          ),
          Obx(() => readinessScoreCard(
                userInfo,
                "Phishing Readiness",
                _serverUpdateController.phishingReadinessUser,
                _serverUpdateController.phishingReadinessCompany,
              )),
          SizedBox(
            height: Get.height * 0.015,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LightTextBody(data: "Tutorial Taken Time  : "),
                LightTextBody(data: userInfo.tutorialTimeTaken)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LightTextBody(data: "Quiz Taken Time  : "),
                LightTextBody(data: userInfo.quizTimeTaken)
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Obx(() => readinessScoreCard(
                userInfo,
                "Quiz Score",
                _serverUpdateController.quizReadinessUser,
                _serverUpdateController.quizReadinessCompnay,
              )),
          // userInfo.phishingEmailRisk??
          //      const Text("")
          //     : SizedBox(
          //         height: Get.height * 0.02,
          //       ),
          userInfo.phishingEmailRisk!.isEmpty ? const Text("") : tableHead(),
          userInfo.phishingEmailRisk!.isEmpty
              ? const Text("")
              : SizedBox(
                  height: Get.height * 0.3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: userInfo.phishingEmailRisk?.length,
                    itemBuilder: (BuildContext context, int index) => tableBody(
                      userInfo.phishingEmailRisk![index].name,
                      userInfo.phishingEmailRisk![index].totalEmailSend,
                      userInfo.phishingEmailRisk![index].totalEmailVisited,
                    ),
                  ),
                ),
          SizedBox(
            height: Get.height * 0.03,
          )
        ],
      ),
    );
  }

  Padding tableBody(
    String first,
    int second,
    int three,
  ) {
    print("tableBody()  first $first second : $second , three : $three");
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Table(
        border: TableBorder.symmetric(
          outside: const BorderSide(width: 1, color: Colors.white),
        ),
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LightTextSub(
                data: first,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LightTextSub(data: "$second")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LightTextSub(data: "$three")),
            ),
          ]),
        ],
      ),
    );
  }

  Padding tableHead() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Table(
        border: TableBorder.symmetric(
          inside: const BorderSide(width: 1, color: Colors.white),
          outside: const BorderSide(width: 1, color: Colors.white),
        ),
        children: const [
          TableRow(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: LightTextBody(
                data: "Category",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: LightTextBody(data: "Total Email Sent"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: LightTextBody(data: "Email Clicked"),
            ),
          ]),
        ],
      ),
    );
  }

  SizedBox readinessScoreCard(UserInfo userInfo, String title,
      List<ChartData> userRedi, List<ChartData> companyRedi) {
    print("tableBody()  userInfo ${userInfo.userName} title : $title ");
    return SizedBox(
      height: Get.height * 0.28,
      width: Get.width,
      child: Card(
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
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: LightTextSubHead(data: title),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: actionOne(userInfo, userRedi, companyRedi),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row actionOne(UserInfo userInfo, List<ChartData> userRedi,
      List<ChartData> companyRedi) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: myCard(
            userInfo.userName,
            userRedi,
          ),
        ),
        Expanded(
          flex: 4,
          child: myCard(
            "Company Avg",
            companyRedi,
          ),
        ),
      ],
    );
  }

  Column myCard(String title, List<ChartData> totalScore) {
    print("myCard  title ${title} ");
    return
        //  Card(
        //   elevation: 7,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(6.0),
        //   ),
        //    color: MyAppTheme.whitehaxBoxSmall,
        //   child:

        Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
          flex: 0,
          child: SizedBox(
            height: 2,
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: DarkTextBody(data: "Total Visit : $totalVist"),
        // ),
        Expanded(
          flex: 5,
          child: SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: LightTextBody(
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
          child: LightTextBody(data: title),
        ),
      ],
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
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: LightTextSubHead(data: "Phishing Simulation Readiness"),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) =>
                      const SimulationReadiness(
                        visisted: "13",
                        color_: MyAppTheme.whitehaxReportYellow,
                        percentStr: "53",
                        percent_: 0.53,
                        status: "Medium",
                        title: "Social Network",
                      )
                  // SimulationReadiness("Social Network", "13", 0.53, "Medium",
                  //     "53", MyAppTheme.whitehaxReportYellow),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Container phishingSimCard(String title, String visisted, double percent_,
      String status, String percentStr, Color color_) {
    return Container(
      margin: const EdgeInsets.all(4),
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
          padding: const EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: color_,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(child: LightTextSub(data: status)),
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
