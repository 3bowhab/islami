import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';

class MostRecentlyItem extends StatelessWidget {
  const MostRecentlyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Al-Fatiha',
                style: AppTextStyles.blackBold(24),
              ),
              Text(
                'الفاتحه',
                style: AppTextStyles.blackBold(24),
              ),
              Text('7 Verses', style: AppTextStyles.blackBold(14)),
            ],
          ),
          Image.asset(Assets.imagesImgMostRecent),
        ],
      ),
    );
  }
}
