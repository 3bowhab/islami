import 'package:flutter/widgets.dart';
import 'package:islami/helper/app_images.dart';
import 'package:islami/model/tabs_model.dart';

class AppLists {
  List<TabsModel> tabs = [
    TabsModel(
      label: 'Quran',
      iconpath: Assets.iconsQuran,
      backgroudImage: Assets.imagesOnboarding1,
      content: Container(),
    ),
    TabsModel(
      label: 'Hadith',
      iconpath: Assets.iconsHadith,
      backgroudImage: Assets.imagesOnboarding2,
      content: Container(),
    ),
    TabsModel(
      label: 'Sebha',
      iconpath: Assets.iconsSebha,
      backgroudImage: Assets.imagesOnboarding3,
      content: Container(),
    ),
    TabsModel(
      label: 'Radio',
      iconpath: Assets.iconsRadio,
      backgroudImage: Assets.imagesOnboarding4,
      content: Container(),
    ),
    TabsModel(
      label: 'Time',
      iconpath: Assets.iconsTime,
      backgroudImage: Assets.imagesOnboarding5,
      content: Container(),
    ),
  ];
}