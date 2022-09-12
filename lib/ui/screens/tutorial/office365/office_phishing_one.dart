import '../../../../ui/widgets/text/bullet_note_light_text_body.dart';
import '../../../../ui/widgets/text/bullet_light_text_body.dart';
import '../../../../ui/widgets/dialogs/office365/office_main_dialog.dart';
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
import '../../../widgets/text/square_light_text_body.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: LightTextHead(
                    data:
                        "1. Subject contains Account Related Error : Account Deactivated, Expired or other errors",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletLightTextBody(
                    data:
                        "Typically an email with Subject line that points to Account Deactivation, Account Expiry, Too many login attempts detected etc. are likely phishing scams.",
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3, top: 8),
                  child: BulletLightTextBody(
                    data: "Steps to detect Scam",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: SquareLightTextBody(
                    data:
                        "Check the Sender’s full Email address. It may contain Microsoft or Microsoft Office but domain name will not end in “microsoft.com”",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 8),
                  child: SquareLightTextBody(
                    data:
                        "Check Login Link provided in the email - the URL will not be a Microsoft url that ends with “microsoft.com” nor it will begin with “https://”",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BulletNoteLightTextBody(
                    data:
                        "Contact your IT system administrator to verify about account related emails.",
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 12.0, top: 10),
                //   child: RichText(
                //     text: const TextSpan(
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: "\u2022",
                //           style: TextStyle(
                //               fontStyle: FontStyle.normal,
                //               fontSize: 22,
                //               fontFamily: Fonts.poppins,
                //               fontWeight: FontWeight.w600),
                //         ),
                //         TextSpan(
                //           text:
                //               " Hover over the Login Link provided in the email and you will notice again that the URL will not be a Microsoft url that ends with “microsoft.com”",
                //           style: TextStyle(
                //               fontStyle: FontStyle.normal,
                //               fontSize: 14,
                //               color: Colors.white),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 12.0, top: 10),
                //   child: RichText(
                //     text: const TextSpan(
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: "\u2022",
                //           style: TextStyle(
                //               fontStyle: FontStyle.normal,
                //               fontSize: 22,
                //               fontFamily: Fonts.poppins,
                //               fontWeight: FontWeight.w600),
                //         ),
                //         TextSpan(
                //           text:
                //               " Most likely the URL will also not begin with “https://”",
                //           style: TextStyle(
                //               fontStyle: FontStyle.normal,
                //               fontSize: 14,
                //               color: Colors.white),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const Padding(
                //   padding: EdgeInsets.all(6.0),
                //   child: LightTextBody(
                //     data:
                //         "(iv) Tip: When in doubt, contact your IT system administrator to verify if your account indeed has been expired, deactivated or in jeopardy of deactivation. You can also forward a copy of the scam email to them for further review and filtering of such messages from other users mailboxes.",
                //   ),
                // ),
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
