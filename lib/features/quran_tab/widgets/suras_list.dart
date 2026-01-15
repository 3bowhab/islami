import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/config/sura_details_config.dart';
import 'package:islami/features/quran_tab/widgets/sura_list_tile.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => SuraListTile(index: index,),
        separatorBuilder: (context, index) => Divider(
          color: AppColors.white,
          indent: AppUtils.width(context) * 0.12,
          endIndent: AppUtils.width(context) * 0.12,
        ),
        itemCount: SuraDetailsConfig.suraList.length,
      ),
    );
    
  }
}