import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/logic/time_view_model.dart';
import 'package:islami/features/time_tab/widgets/triangle_clipper.dart';

class PrayTimeHeader extends StatelessWidget {
  final TimeViewModel timeViewModel;
  const PrayTimeHeader({super.key, required this.timeViewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [
            TriangleClipper(clipper: LeftTriangleClipper()),
            Container(
              height: AppUtils.height(context) * (90 / 932),
              width: AppUtils.width(context) * (166 / 430),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Column(
                  children: [
                    Text('Pray Time', style: AppTextStyles.lightBlackBold(20)),
                    Text(timeViewModel.dayName ?? '', style: AppTextStyles.blackBold(20)),
                  ],
                ),
              ),
            ),
            TriangleClipper(clipper: RightTriangleClipper()),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
          child: Row(
            children: [
              Text(
                timeViewModel.greDate ?? '',
                style: AppTextStyles.whiteBold(16),
              ),
              Spacer(),
              Text(
                timeViewModel.hijriDate ?? '',
                textAlign: TextAlign.end,
                style: AppTextStyles.whiteBold(16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
