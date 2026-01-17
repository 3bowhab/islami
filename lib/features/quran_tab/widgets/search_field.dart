import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.whiteBold(16),
      cursorColor: AppColors.gold,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Sura Name',
        labelStyle: AppTextStyles.whiteBold(16),
        prefixIcon: Image.asset(Assets.iconsQuran, color: AppColors.gold),
        filled: true,
        fillColor: AppColors.black.withValues(alpha: 0.7),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gold, width: 2),
        ),
      ),
    );
  }
}
