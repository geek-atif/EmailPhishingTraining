import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles/fonts.dart';
import '../../widgets/text/light_text_body.dart';
import '../../widgets/text/light_text_body_sub.dart';

class SimulationReadiness extends StatefulWidget {
  final String title;
  final String visisted;
  final double percent_;
  final String status;
  final String percentStr;
  final Color color_;
  const SimulationReadiness(
      {super.key,
      required this.title,
      required this.visisted,
      required this.percent_,
      required this.status,
      required this.percentStr,
      required this.color_});

  @override
  State<SimulationReadiness> createState() => _SimulationReadinessState();
}

class _SimulationReadinessState extends State<SimulationReadiness> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: LightTextBody(data: widget.visisted),
          backgroundColor: widget.color_,
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
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
            color: widget.color_,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(child: LightTextSub(data: widget.status)),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: LinearPercentIndicator(
            width: Get.size.width * 0.35,
            lineHeight: Get.size.height * 0.025,
            percent: widget.percent_,
            alignment: MainAxisAlignment.start,
            animation: true,
            //curve: Curves.bounceOut,
            backgroundColor: Colors.grey.shade300,
            progressColor: widget.color_,
            barRadius: const Radius.circular(10),
            center: Text("${widget.percentStr}%"),
          ),
        ),
      ),
    );
  }
}
