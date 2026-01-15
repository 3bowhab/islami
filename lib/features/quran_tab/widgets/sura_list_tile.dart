import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/constants/app_routes.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/config/sura_details_config.dart';

class SuraListTile extends StatelessWidget {
  final int index;
  const SuraListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, AppRoutes.souraDetailsView, arguments: SuraDetailsConfig.suraList[index]),
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: AppUtils.width(context) * (70 / 430),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSuraNumber),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text('${index + 1}', style: AppTextStyles.whiteBold(16)),
        ),
      ),
      title: Text(
        SuraDetailsConfig.englishQuranSurahs[index],
        style: AppTextStyles.whiteBold(20),
      ),
      subtitle: Text(
        "${SuraDetailsConfig.ayaNumber[index]} Verses",
        style: AppTextStyles.whiteBold(14),
      ),
      trailing: Text(
        SuraDetailsConfig.arabicQuranSuras[index],
        style: AppTextStyles.whiteBold(20),
      ),
    );
  }
}
