import 'package:PhishSim/ui/widgets/dialogs/office365/office_main_dialog.dart';
import 'package:PhishSim/ui/widgets/text/light_text_body_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../styles/fonts.dart';
import '../../../widgets/dialogs/office365/office_one_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_sub_head.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/my_dialogs.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../widgets/text/light_text_head.dart';

class OfficePhishingOne extends StatefulWidget {
  const OfficePhishingOne({Key? key}) : super(key: key);

  @override
  State<OfficePhishingOne> createState() => _OfficePhishingOneState();
}

class _OfficePhishingOneState extends State<OfficePhishingOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey<State> keyLoader = GlobalKey<State>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      OfficeMainDialog.showLoadingDialog(context, keyLoader);
    });
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: LightTextHead(
                    data:
                        "1. Subject contains Account Related Error : Account Deactivated, Expired or other errors",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data:
                        "(i) Typically this type of phishing scam will have a Subject line that will point to account deactivation, account expiry, too many login attempt detected or such account related error.",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data:
                        "(ii) See an example of such email in the image on the side",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "(iii) Steps to detect this type of Phishing Scam",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "\u2022",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 22,
                              fontFamily: Fonts.poppins,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              " Click on the Sender’s Email address or hover over it. While it may contain Microsoft or Microsoft Office – the domain name will not end in “microsoft.com”",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "\u2022",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 22,
                              fontFamily: Fonts.poppins,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              " Hover over the Login Link provided in the email and you will notice again that the URL will not be a Microsoft url that ends with “microsoft.com”",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "\u2022",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 22,
                              fontFamily: Fonts.poppins,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              " Most likely the URL will also not begin with “https://”",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data:
                        "(iv) Tip: When in doubt, contact your IT system administrator to verify if your account indeed has been expired, deactivated or in jeopardy of deactivation. You can also forward a copy of the scam email to them for further review and filtering of such messages from other users mailboxes.",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () =>
                      OfficeOneDialog.showLoadingDialog(context, keyLoader),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Next"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
