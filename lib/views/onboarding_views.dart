import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/helper/app_colors.dart';
import 'package:islami/helper/app_routes.dart';
import 'package:islami/helper/app_text_styles.dart';
import 'package:islami/helper/pages_list.dart';


class OnBoardingViews extends StatelessWidget {
  const OnBoardingViews({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      showBackButton: true,
      globalBackgroundColor: AppColors.black,
      next: Text("Next", style: AppTextStyles().goldBold(16)),
      done: Text("Finish", style: AppTextStyles().goldBold(16)),
      back: Text("Back", style: AppTextStyles().goldBold(16)),
      autoScrollDuration: 10000,
      controlsPadding: const EdgeInsets.only(
        bottom: 50, 
      ),
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.gold,
        color: AppColors.grey,
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeView);
      },
    );
  }
}
