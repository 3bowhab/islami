import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/logic/get_next_prayer.dart';
import 'package:islami/features/time_tab/widgets/card_slider.dart';

class PrayTimeBody extends StatefulWidget {
  const PrayTimeBody({super.key});

  @override
  State<PrayTimeBody> createState() => _PrayTimeBodyState();
}

class _PrayTimeBodyState extends State<PrayTimeBody> {
  Timer? timer;
  Map<String, dynamic>? nextPrayer;

  @override
  void initState() {
    super.initState();
    updateNextPrayer();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateNextPrayer();
    });
  }

  void updateNextPrayer() {
    setState(() {
      nextPrayer = getNextPrayer();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Duration remaining = nextPrayer!['remaining'];

    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppUtils.height(context) * (25 / 932),
          ),
          child: Column(
            spacing: AppUtils.height(context) * (8 / 932),
            children: [
              const CardsSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Next Pray - ', style: AppTextStyles.lightBlackBold(16)),
                  Text(
                    '${remaining.inHours.toString().padLeft(2, '0')}:'
                    '${remaining.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
                    '${remaining.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                    style: AppTextStyles.blackBold(16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}