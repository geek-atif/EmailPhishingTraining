import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../ui/styles/images.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: Images.office1,
    title: 'theattackchain'.tr,
    description:
        "${'theattackchainOne'.tr} ${'theattackchainSubOne'.tr}\n ${'theattackchainSubTwo'.tr}\n ${'theattackchainSubThree'.tr}",
  ),
  Slide(
    imageUrl: Images.office2,
    title: 'microsoftHead'.tr,
    description:
        "${'microsoftSubHead'.tr} ${'microsoftSubHeadOne'.tr}\n ${'microsoftSubBodyOne'.tr}\n ${'microsoftSubHeadTwo'.tr}",
  ),
];
