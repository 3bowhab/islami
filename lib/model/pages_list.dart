import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/helper/app_images.dart';
import 'package:islami/helper/app_text_styles.dart';

// List of onboarding pages.
final List<PageViewModel> pages = [
  pageViewModel(
    title: "Welcome To Islami App",
    imageNumber: 1,
  ),
  pageViewModel(
    title: "Welcome To Islami",
    body: "We Are Very Excited To Have You In Our Community",
    imageNumber: 2,
  ),
  pageViewModel(
    title: "Reading the Quran",
    body: "Read, and your Lord is the Most Generous",
    imageNumber: 3,
  ),
  pageViewModel(
    title: "Bearish",
    body: "Praise the name of your Lord, the Most High",
    imageNumber: 4,
  ),
  pageViewModel(
    title: "Holy Quran Radio",
    body: "You can listen to the Holy Quran Radio through the application for free and easily",
    imageNumber: 5,
  ),
];

// Method to create a PageViewModel.
PageViewModel pageViewModel({required String title, String body = "", required int imageNumber}) {
  return PageViewModel(
    titleWidget: Text(title, style: AppTextStyles.goldBold(24)),
    bodyWidget: Text(
      body,
      textAlign: .center,
      style: AppTextStyles.goldBold(20),
    ),
    image: SafeArea(
      bottom: false,
      child: Column(
        children: [
          Image.asset(Assets.imagesIslami),
          Expanded(child: Image.asset('assets/images/onboarding$imageNumber.png')),
        ],
      ),
    ),
    decoration: const PageDecoration(imageFlex: 4, bodyFlex: 0),
  );
}