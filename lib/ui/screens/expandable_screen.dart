import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:threattraining/ui/styles/my_app_theme.dart';
import 'package:threattraining/ui/widgets/text/light_text_body.dart';
import '../../ui/styles/images.dart';
import '../../ui/widgets/text/dark_text_head.dart';

class ExpandableScreen extends StatefulWidget {
  const ExpandableScreen({Key? key}) : super(key: key);

  @override
  State<ExpandableScreen> createState() => _ExpandableScreenState();
}

class _ExpandableScreenState extends State<ExpandableScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
        backgroundColor: MyAppTheme.grey300,
        body: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.black,
            useInkWell: true,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Card1(),
              Card2(),
            ],
          ),
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Image.asset(Images.office1),
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                    padding: const EdgeInsets.all(10),
                    child: DarkTextHead(
                      data: "theattackchain".tr,
                    ),
                  ),
                  collapsed: Text(
                    "theattackchainOne".tr,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DarkTextBody(
                        data: "theattackchainOne".tr,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DarkTextHead(
                        data: "theattackchainTwo".tr,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DarkTextBody(
                        data: "theattackchainSubOne".tr,
                      ),
                      DarkTextBody(
                        data: "theattackchainSubTwo".tr,
                      ),
                      DarkTextBody(
                        data: "theattackchainSubThree".tr,
                      ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Image.asset(Images.office2),
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                    padding: const EdgeInsets.all(10),
                    child: DarkTextHead(
                      data: "microsoftHead".tr,
                    ),
                  ),
                  collapsed: Text(
                    "microsoftSubHead".tr,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DarkTextBody(
                        data: "microsoftSubHead".tr,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DarkTextHead(
                        data: "microsoftSubHeadOne".tr,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DarkTextBody(
                        data: "microsoftSubBodyOne".tr,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DarkTextHead(
                        data: "microsoftSubHeadTwo".tr,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      DarkTextBody(
                        data: "microsoftSubBodyTwo".tr,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DarkTextHead(
                        data: "microsoftSubHeadThree".tr,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      DarkTextBody(
                        data: "microsoftSubBodyThree".tr,
                      ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
