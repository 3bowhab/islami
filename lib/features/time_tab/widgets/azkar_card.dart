import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';

class AzkarCard extends StatelessWidget {
  final String title;
  final String imagePath;
  const AzkarCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppUtils.height(context) * (260 / 932),
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border.all(color: AppColors.gold, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: .symmetric(vertical: AppUtils.height(context) * (15 / 932)),
          child: Column(
            spacing: AppUtils.height(context) * (10 / 932),
            children: [
              Image.asset(imagePath, fit: BoxFit.cover),
              Text(title, style: AppTextStyles.whiteBold(16),)
            ],
          ),
        ),
      ),
    );
  }
}