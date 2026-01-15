import 'package:flutter/widgets.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/features/home/models/tabs_model.dart';
import 'package:islami/features/quran_tab/view/quran_tab_content.dart';
import 'package:islami/features/radio_tab/view/radio_tab_content.dart';
import 'package:islami/features/sebha_tab/views/sebha_tab_content.dart';
import 'package:islami/features/time_tab/views/time_tab_content.dart';

class HomeTabsConfig {
  static List<TabsModel> tabs = [
    TabsModel(
      label: 'Quran',
      iconpath: Assets.iconsQuran,
      backgroudImage: Assets.imagesBackground,
      content: QuranTabContent(),
    ),
    TabsModel(
      label: 'Hadith',
      iconpath: Assets.iconsHadith,
      backgroudImage: Assets.imagesBackground,
      content: Container(),
    ),
    TabsModel(
      label: 'Sebha',
      iconpath: Assets.iconsSebha,
      backgroudImage: Assets.imagesSebhaBackground,
      content: SebhaTabContent(),
    ),
    TabsModel(
      label: 'Radio',
      iconpath: Assets.iconsRadio,
      backgroudImage: Assets.imagesRadioBackground,
      content: RadioTabContent(),
    ),
    TabsModel(
      label: 'Time',
      iconpath: Assets.iconsTime,
      backgroudImage: Assets.imagesBackground,
      content: TimeTabContent(),
    ),
  ];
}
