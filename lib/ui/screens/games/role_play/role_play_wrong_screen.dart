import '../../../../ui/routers/my_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import '../../../../utiles/constant.dart';
import '../../../../utiles/sound_constant.dart';
import '../../../styles/images.dart';
import '../../../styles/my_app_theme.dart';
import '../../../widgets/text/light_text_sub_head.dart';

class RolePlayWrongScreen extends StatefulWidget {
  const RolePlayWrongScreen({super.key});

  @override
  State<RolePlayWrongScreen> createState() => _RolePlayWrongScreenState();
}

class _RolePlayWrongScreenState extends State<RolePlayWrongScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    player = AudioPlayer();
    playSound();
  }

  void playSound() async {
    if (!GetPlatform.isWindows) {
      await player.setAsset(SoundConstant.ohNo);
      player.play();
    }
  }

  @override
  void dispose() {
    player.dispose();
    _controller.dispose();
    super.dispose();
  }

  final GlobalKey<State> keyLoader = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppTheme.whitehaxBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Stack(
                //alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Align(
                      //alignment: Alignment.center,
                      child: Image.asset(
                        Images.laptopComp,
                        fit: BoxFit.fitHeight,
                        height: Get.height * 0.8,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.offAllNamed(MyRouter.rolePlaySubHome),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: MyAppTheme.whitehaxButtonColor,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.045,
                        ),
                        Lottie.asset(ohNoJson),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
