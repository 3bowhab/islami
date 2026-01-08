import 'package:flutter/material.dart';
import 'package:islami/helper/app_colors.dart';
import 'package:islami/helper/app_images.dart';
import 'package:islami/helper/app_lists.dart';
import 'package:islami/helper/app_text_styles.dart';
import 'package:islami/model/tabs_model.dart';
import 'package:islami/widgets/custom_navigation_des.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final List<TabsModel> tabs = AppLists().tabs;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          tabs[selectedIndex].backgroudImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: NavigationBar(
            backgroundColor: AppColors.gold,
            indicatorColor: AppColors.black.withValues(alpha: .6),
            labelTextStyle: WidgetStateProperty.all(AppTextStyles.whiteBold(12)),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex,
            destinations: List.generate(
              tabs.length,
              (index) => CustomNavigationDes(
                iconPath: tabs[index].iconpath,
                label: tabs[index].label,
              ),
            ),
          ),
          body: Column(
            children: [
              Image.asset(Assets.imagesIslami),
              tabs[selectedIndex].content,
            ],
          ),
        ),
      ],
    );
  }
}