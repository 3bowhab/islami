import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/time_tab/widgets/triangle_clipper.dart';

class PrayTimeHeader extends StatelessWidget {
  const PrayTimeHeader({
    super.key,
  });

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
                    Text(
                      'Pray Time',
                      style: AppTextStyles.blackBold(20).copyWith(
                        color: AppTextStyles.blackBold(
                          20,
                        ).color!.withValues(alpha: 0.7),
                      ),
                    ),
                    Text('Tuesday', style: AppTextStyles.blackBold(20)),
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
              Text('16 Jul,\n2024', style: AppTextStyles.whiteBold(20),),
              Spacer(),
              Text('09 Muh,\n1446', textAlign: TextAlign.end, style: AppTextStyles.whiteBold(20)),
            ],
          ),
        ),
      ],
    );
  }
}
