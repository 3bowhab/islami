import 'package:flutter/material.dart';
import 'package:islami/helper/app_colors.dart';
import 'package:islami/helper/app_text_styles.dart';
import 'package:islami/helper/app_utils.dart';

class RadioTabNavigator extends StatelessWidget {
  const RadioTabNavigator({
    super.key,
    required PageController controller,
    required this.currentPage,
  }) : _controller = controller;

  final PageController _controller;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppUtils.height(context) * (40 / 932),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black.withValues(alpha: 0.7),
      ),
      child: Row(
        children: [
          tabButton(
            context,
            index: 0,
            label: "Radio",
            onTap: () {
              _controller.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          tabButton(
            context,
            index: 1,
            label: "Reciters",
            onTap: () {
              _controller.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }

  Expanded tabButton(BuildContext context, {required VoidCallback onTap, required int index, required String label}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: AppUtils.height(context) * (40 / 932),
          padding: .symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.gold : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: currentPage == index
                ? AppTextStyles.blackBold(16)
                : AppTextStyles.whiteBold(16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
