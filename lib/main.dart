import 'package:flutter/material.dart';
import 'package:islami/helper/app_routes.dart';
import 'package:islami/views/home_view.dart';
import 'package:islami/views/onboarding_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingView,
      routes: {
        AppRoutes.onboardingView: (context) => const OnBoardingViews(),
        AppRoutes.homeView: (context) => const HomeView(),
      },
    );
  }
}