import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/widgets/azkar_card.dart';

class Azkar extends StatelessWidget {
  const Azkar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppUtils.height(context) * (20 / 932),
      ),
      child: Column(
        spacing: AppUtils.width(context) * (20 / 430),
        children: [
          Row(
            children: [
              AzkarCard(title: 'Evening Azkar', imagePath: Assets.imagesAzkar1,),
              SizedBox(width: AppUtils.width(context) * (20 / 430)),
              AzkarCard(title: 'Morning Azkar', imagePath: Assets.imagesAzkar2,),
            ],
          ),
          Row(
            children: [
              AzkarCard(title: 'Walking Azkar', imagePath: Assets.imagesAzkar1,),
              SizedBox(width: AppUtils.width(context) * (20 / 430)),
              AzkarCard(title: 'Sleeping Azkar', imagePath: Assets.imagesAzkar2,),
            ],
          ),
        ],
      ),
    );
  }
}