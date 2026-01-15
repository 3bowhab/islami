import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/home/models/tabs_model.dart';
import 'package:islami/features/home/config/tabs_list.dart';
import 'package:islami/features/home/widgets/custom_navigation_des.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final List<TabsModel> tabs = HomeTabsConfig.tabs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
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
            body: SafeArea(
              child: Padding(
                padding: .symmetric(horizontal: AppUtils.width(context) * 0.04),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Image.asset(Assets.imagesIslami),
                    Expanded(child: tabs[selectedIndex].content),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}