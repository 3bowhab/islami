import 'package:flutter/material.dart';
import 'package:islami/helper/app_colors.dart';

class CustomNavigationDes extends StatelessWidget {
  final String iconPath;
  final String label;
  const CustomNavigationDes({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: ImageIcon(AssetImage(iconPath)),
      label: label,
      selectedIcon: ImageIcon(AssetImage(iconPath), color: AppColors.white),
    );
  }
}
