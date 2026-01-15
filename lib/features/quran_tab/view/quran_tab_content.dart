import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/quran_tab/widgets/most_recently.dart';
import 'package:islami/features/quran_tab/widgets/search_field.dart';
import 'package:islami/features/quran_tab/widgets/suras_list.dart';

class QuranTabContent extends StatelessWidget {
  const QuranTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: AppUtils.height(context) * 0.02,
      children: [
        SearchField(),
        Text('Most Recently', style: AppTextStyles.offWhiteBold(16)),
        MostRecently(),
        SurasList(),
      ],
    );
  }
}