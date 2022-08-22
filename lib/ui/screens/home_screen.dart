import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import '../styles/my_app_theme.dart';
import '../widgets/navigationmenu/my_navigation_menu.dart';
import '../../ui/routers/my_router.dart';
import '../../ui/widgets/button/dark_blue_button.dart';
import 'package:flutter/material.dart';
import '../widgets/text/light_text_sub_head.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> keyLoader = GlobalKey<SliderDrawerState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: const SliderAppBar(
            appBarColor: MyAppTheme.whitehaxBackgroundColor,
            title: LightTextSubHead(
              data: "Home",
            ),
            drawerIconColor: Colors.white,
          ),
          key: keyLoader,
          slider: const MyNavigationMenu(),
          child: homeContiner(),
          splashColor: Colors.white,
        ),
      ),
    );
  }

  Container homeContiner() {
    return Container(
      color: MyAppTheme.whitehaxBackgroundColor,
      alignment: Alignment.center,
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 30),
          //   child: InkWell(
          //     onTap: () => Get.toNamed(MyRouter.officePhishing),
          //     child: DarkBlueButton(
          //       buttonText: "Office 365 phishing",
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
