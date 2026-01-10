import 'package:flutter/material.dart';
import 'package:islami/helper/app_text_styles.dart';
import 'package:islami/helper/app_utils.dart';
import 'package:islami/widgets/most_recently.dart';
import 'package:islami/widgets/search_field.dart';
import 'package:islami/widgets/suras_list.dart';

class QuranTabContent extends StatelessWidget {
  const QuranTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: AppUtils.width(context) * 0.04),
      child: Column(
        crossAxisAlignment: .start,
        spacing: AppUtils.height(context) * 0.02,
        children: [
          SearchField(),
          Text('Most Recently', style: AppTextStyles.offWhiteBold(16)),
          MostRecently(),
          SurasList(),
        ],
      ),
    );
  }
}