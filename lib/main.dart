import 'package:flutter/material.dart';
import 'package:islami/helper/app_colors.dart';
import 'package:islami/helper/app_routes.dart';
import 'package:islami/service/prefs_service.dart';
import 'package:islami/views/home_view.dart';
import 'package:islami/views/onboarding_views.dart';
import 'package:islami/views/soura_details_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool seenIntro = await PrefsService.hasSeenIntro();

  runApp(MyApp(seenIntro: seenIntro));
}

class MyApp extends StatelessWidget {
  final bool seenIntro;
  const MyApp({super.key, required this.seenIntro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: seenIntro ? AppRoutes.homeView : AppRoutes.onboardingView,
      routes: {
        AppRoutes.onboardingView: (context) => const OnBoardingViews(),
        AppRoutes.homeView: (context) => const HomeView(),
        AppRoutes.souraDetailsView: (context) => const SouraDetailsView(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.gold,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
    );
  }
}