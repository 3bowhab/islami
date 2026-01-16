import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/widgets/pray_time_body.dart';
import 'package:islami/features/time_tab/widgets/pray_time_header.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppUtils.height(context) * (300 / 932),
      decoration: BoxDecoration(
        color: AppColors.lightBrown,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          PrayTimeHeader(),
          PrayTimeBody(),
        ],
      ),
    );
  }
}