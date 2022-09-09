import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../controller/server_update_controller.dart';
import '../../../styles/fonts.dart';
import '../../../widgets/dialogs/office365/office_four_dialog.dart';
import '../../../widgets/dialogs/office365/office_one_dialog.dart';
import '../../../widgets/my_app_bar.dart';
import '../../../widgets/text/light_text_sub_head.dart';
import '../../../widgets/button/dark_blue_button.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/dialogs/my_dialogs.dart';
import '../../../widgets/text/light_text_body.dart';
import '../../../widgets/text/light_text_head.dart';

class OfficePhishingFourScreen extends StatefulWidget {
  const OfficePhishingFourScreen({Key? key}) : super(key: key);

  @override
  State<OfficePhishingFourScreen> createState() =>
      _OfficePhishingFourScreenState();
}

class _OfficePhishingFourScreenState extends State<OfficePhishingFourScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey<State> keyLoader = GlobalKey<State>();
  final ServerUpdateController _serverUpdateController =
      Get.put(ServerUpdateController());
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
                    data: "4. Shared documents scams",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "sharepointOne".tr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "sharepointTwo".tr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "sharepointThree".tr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "sharepointFour".tr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data: "sharepointFive".tr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 8),
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
                              " You should note the sender’s email address. However, unlike the other scams above, the email may come from a compromised company account or a known sender account. Therefore, do not rely only on verifying sender’s email",
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
                  padding: const EdgeInsets.only(left: 12.0, top: 5),
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
                              " Hover over the Login Link provided in the email and you will notice again that the URL will not be a Microsoft url that ends with “microsoft.com” or “onedrive.com”",
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
                  padding: const EdgeInsets.only(left: 12.0, top: 5),
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
                              " If it has a pdf attachment, the sender email address looks legit and you are not expecting a shared document from that sender, it is strongly recommended that you contact the sender directly to ask if they have shared the document with you. Only open such attachment after confirming with the sender.",
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
                  height: 15,
                ),
                LightTextSubHead(data: "Best Practice"),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LightTextBody(
                    data:
                        "Do not click the URL link or attachment in any email before verifying the sender and URL Link. If the sender appears legit but you do not know of any documents that are supposed to be shared with you, do not open the attachment until you verify the identity of the sender. If you accidently do click the link, close your browser and delete any downloaded files from your device.",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => OfficeFourDialog.showLoadingDialog(
                      context, keyLoader, _serverUpdateController),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DarkBlueButton(buttonText: "Done"),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
