import 'package:PhishSim/ui/styles/my_app_theme.dart';
import 'package:PhishSim/ui/widgets/text/light_text_body.dart';
import 'package:get/get.dart';

import '../../../controller/simple_login_controller.dart';
import '../../../ui/widgets/button/dark_blue_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/loading.dart';

class SimpleLoginScreen extends StatefulWidget {
  const SimpleLoginScreen({super.key});

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  final SimpleLoginController _simpleLoginController =
      Get.put(SimpleLoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAliases();
  }

  getAliases() {
    _simpleLoginController.getAllAliasese();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => _simpleLoginController.isLoading.value
                    ? const Loading(
                        loadingMessage: '',
                      )
                    : Expanded(
                        child: ListView.builder(
                            // addAutomaticKeepAlives: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _simpleLoginController.aliases.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    LightTextBody(
                                        data:
                                            "aliases ${_simpleLoginController.aliases[index].email}"),
                                    const Divider(
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
