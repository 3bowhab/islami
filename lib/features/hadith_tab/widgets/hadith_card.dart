import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/models/hadith_model.dart';

class HadithCard extends StatelessWidget {
  const HadithCard({
    super.key,
    required this.hadithList, required this.itemIndex,
  });
  final int itemIndex;
  final List<HadithModel> hadithList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppUtils.width(context) * (20 / 430),
        vertical: AppUtils.height(context) * (50 / 932),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.gold,
        image: DecorationImage(
          image: AssetImage(Assets.imagesHadithBackground),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: hadithList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            )
          : Column(
            spacing: AppUtils.height(context) * (10 / 932),
              children: [
                Text(
                  hadithList[itemIndex].title,
                  style: AppTextStyles.blackBold(24),
                ),
                Expanded(
                  child: Text(
                    hadithList[itemIndex].content.join('\n\n'),
                    style: AppTextStyles.blackBold(16),
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
    );
  }
}
