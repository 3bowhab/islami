import 'package:flutter/widgets.dart';
import 'package:islami/helper/app_images.dart';
import 'package:islami/model/tabs_model.dart';
import 'package:islami/views/quran_tab_content.dart';
import 'package:islami/views/radio_tab_content.dart';
import 'package:islami/views/sebha_tab_content.dart';

class AppLists {
  List<TabsModel> tabs = [
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
      content: Container(),
    ),
  ];
}