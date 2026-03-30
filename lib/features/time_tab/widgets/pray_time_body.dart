import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/logic/time_view_model.dart';
import 'package:islami/features/time_tab/widgets/card_slider.dart';
import 'package:islami/features/time_tab/widgets/pray_time_bottom.dart';

class PrayTimeBody extends StatelessWidget {
  final TimeViewModel timeViewModel;
  const PrayTimeBody({super.key, required this.timeViewModel});

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
          padding: EdgeInsets.symmetric(
            vertical: AppUtils.height(context) * (15 / 932),
          ),
          child: Column(
            spacing: AppUtils.height(context) * (20 / 932),
            children: [
              CardsSlider(timeViewModel: timeViewModel),
              PrayTimeBottom(timeViewModel: timeViewModel),
            ],
          ),
        ),
      ),
    );
  }
}