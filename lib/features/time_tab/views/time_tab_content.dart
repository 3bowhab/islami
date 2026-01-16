import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/widgets/azkar.dart';
import 'package:islami/features/time_tab/widgets/pray_time.dart';

class TimeTabContent extends StatelessWidget {
  const TimeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PrayTime(),
        SizedBox(height: AppUtils.height(context) * (20 / 932)),
        Text('Azkar', style: AppTextStyles.whiteBold(16)),
        Azkar(),
      ],
    );
  }
}