import 'package:flutter/services.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../styles/my_app_theme.dart';
import '../widgets/navigationmenu/my_navigation_menu.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.didChangeDependencies();
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
        children: [],
      ),
    );
  }
}
