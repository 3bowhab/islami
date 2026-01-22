import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/models/sura_model.dart';
import 'package:islami/features/quran_tab/widgets/sura_list_tile.dart';

class SurasList extends StatelessWidget {
  const SurasList({
    super.key,
    required this.filterList,
  });

  final List<SuraModel> filterList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            SuraListTile(
              index: index,
              filterList: filterList,
            ),
            Divider(
              color: AppColors.white,
              indent: AppUtils.width(context) * 0.12,
              endIndent: AppUtils.width(context) * 0.12,
            ),
          ],
        );
      }, childCount: filterList.length),
    );
  }
}

