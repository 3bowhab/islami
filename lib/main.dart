import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/constants/app_routes.dart';
import 'package:islami/data/service/prefs_service.dart';
import 'package:islami/features/hadith_tab/view/hadith_details_view.dart';
import 'package:islami/features/home/view/home_view.dart';
import 'package:islami/features/onboarding/view/onboarding_views.dart';
import 'package:islami/features/quran_tab/view/soura_details_view.dart';

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

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
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      initialRoute: seenIntro ? AppRoutes.homeView : AppRoutes.onboardingView,
      routes: {
        AppRoutes.onboardingView: (context) => const OnBoardingViews(),
        AppRoutes.homeView: (context) => const HomeView(),
        AppRoutes.souraDetailsView: (context) => const SouraDetailsView(),
        AppRoutes.hadithDetailsView: (context) => const HadithDetailsView(),
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