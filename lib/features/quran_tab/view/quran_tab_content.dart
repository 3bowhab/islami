import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/config/sura_details_config.dart';
import 'package:islami/data/models/sura_model.dart';
import 'package:islami/features/quran_tab/widgets/most_recently.dart';
import 'package:islami/features/quran_tab/widgets/search_field.dart';
import 'package:islami/features/quran_tab/widgets/suras_list.dart';

class QuranTabContent extends StatefulWidget {
  const QuranTabContent({super.key});

  @override
  State<QuranTabContent> createState() => _QuranTabContentState();
}

class _QuranTabContentState extends State<QuranTabContent> {
  List<SuraModel> filterList = [];

  @override
  void initState() {
    super.initState();
    filterList = SuraDetailsConfig.suraList;
  }

  void onchanged(String text) {
    setState(() {
      filterList = SuraDetailsConfig.suraList.where((sura) {
        return sura.arabicName.contains(text) ||
            sura.englishName.toLowerCase().contains(text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: AppUtils.height(context) * 0.02,
      children: [
        Center(child: Image.asset(Assets.imagesIslami)),
        SearchField(onChanged: onchanged),
        Text('Most Recently', style: AppTextStyles.offWhiteBold(16)),
        MostRecently(),
        SurasList(filterList: filterList),
      ],
    );
  }
}
