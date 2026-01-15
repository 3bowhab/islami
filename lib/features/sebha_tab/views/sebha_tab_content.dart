import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/features/sebha_tab/widgets/sebha_counter.dart';

class SebhaTabContent extends StatelessWidget {
  const SebhaTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: AppTextStyles.whiteBold(36),
        ),
        const SizedBox(height: 16),
        SebhaCounter(),
      ],
    );
  }
}
