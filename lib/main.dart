import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controller/binding_controller.dart';
import 'ui/routers/my_router.dart';
import 'ui/styles/locale_string.dart';
import 'ui/styles/my_app_theme.dart';

void main() async {
  BindingController().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: MyAppTheme.primaryColorSecond),
  );

  //await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MainApp());
  });
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setPreferredOrientations([
      services.DeviceOrientation.portraitUp,
      services.DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      //locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'EmailPhishingTraining',
      getPages: MyRouter.route,
    );
  }
}
