import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/config/pray_time_data.dart';

class CardsSlider extends StatefulWidget {
  const CardsSlider({super.key});

  @override
  State<CardsSlider> createState() => _CardsSliderState();
}

class _CardsSliderState extends State<CardsSlider> {
  final PageController _controller = PageController(viewportFraction: 0.30);
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppUtils.height(context) * (128 / 932),
      width: double.infinity,
      child: PageView.builder(
        controller: _controller,
        itemCount: 5,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final bool isActive = index == currentIndex;

          return AnimatedScale(
            scale: isActive ? 1.0 : 0.8,
            duration: const Duration(milliseconds: 300),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [AppColors.black, AppColors.beige],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(PrayTimeData.prayNames[index], style: AppTextStyles.whiteBold(16)),
                  Text(PrayTimeData.prayerTimes[index].substring(0, 5)  , style: AppTextStyles.whiteBold(32)),
                  Text(PrayTimeData.prayerTimes[index].substring(6), style: AppTextStyles.whiteBold(16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
