import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/config/sura_details_config.dart';
import 'package:islami/features/quran_tab/widgets/most_recently_item.dart';

class MostRecently extends StatelessWidget {
  final List<int> mostRecentSuras;
  const MostRecently({super.key, required this.mostRecentSuras});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentSuras.isEmpty,
      replacement: SizedBox(
        height: AppUtils.height(context) * (150 / 932),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(width: AppUtils.width(context) * (10 / 430)),
          itemCount: mostRecentSuras.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final suraIndex = mostRecentSuras[index];
            final sura = SuraDetailsConfig.suraList[suraIndex];
            return MostRecentlyItem(sura: sura);
          },
        ),
      ),
      child: Center(child: Text('There is no recently sura', style: AppTextStyles.offWhiteBold(16),)),
    );
  }
}
