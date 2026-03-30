import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/logic/get_next_prayer.dart';
import 'package:islami/features/time_tab/logic/time_view_model.dart';

class PrayTimeBottom extends StatefulWidget {
  final TimeViewModel timeViewModel;
  const PrayTimeBottom({super.key, required this.timeViewModel});

  @override
  State<PrayTimeBottom> createState() => _PrayTimeBottomState();
}

class _PrayTimeBottomState extends State<PrayTimeBottom> {
  Duration get remaining => nextPrayer!['remaining'];
  Timer? timer;
  Map<String, dynamic>? nextPrayer;
  bool isMuted = false;

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
      nextPrayer = getNextPrayer(widget.timeViewModel.prayerValues);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Row(
          mainAxisAlignment: .center,
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
        Padding(
          padding: EdgeInsets.only(right: AppUtils.width(context) * (30 / 430)),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMuted = !isMuted;
              });
            },
            child: ImageIcon(
              AssetImage(
                isMuted ? Assets.iconsVolumeCross : Assets.iconsVolumeHigh,
              ),
              size: 25,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}