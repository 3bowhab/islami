import 'package:flutter/material.dart';
import 'package:islami/helper/app_utils.dart';
import 'package:islami/widgets/search_field.dart';

class QuranTabContent extends StatelessWidget {
  const QuranTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtils.width(context) * 0.04,
      ),
      child: Column(
        children: [
          SearchField(),
        ],
      ),
    );
  }
}