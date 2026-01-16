import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/widgets/card_slider.dart';

class PrayTimeBody extends StatelessWidget {
  const PrayTimeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppUtils.height(context) * (28 / 932)),
          child: Column(
            children: [
              CardsSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
