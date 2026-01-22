import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_routes.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/models/sura_model.dart';

class MostRecentlyItem extends StatelessWidget {
  final SuraModel sura;
  const MostRecentlyItem({
    super.key, required this.sura,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.souraDetailsView,
          arguments: sura,
        );
      },
      child: Container(
        padding: .only(
          left: AppUtils.width(context) * (17 / 430),
          bottom: AppUtils.height(context) * (12 / 932),
          top: AppUtils.height(context) * (12 / 932),
        ),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: .circular(20),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceEvenly,
              children: [
                Text(
                  sura.englishName,
                  style: AppTextStyles.blackBold(24),
                ),
                Text(
                  sura.arabicName,
                  style: AppTextStyles.blackBold(24),
                ),
                Text('${sura.ayaCount} Verses', style: AppTextStyles.blackBold(14)),
              ],
            ),
            Image.asset(Assets.imagesImgMostRecent),
          ],
        ),
      ),
    );
  }
}
