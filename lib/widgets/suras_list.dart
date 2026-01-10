import 'package:flutter/material.dart';
import 'package:islami/helper/app_colors.dart';
import 'package:islami/helper/app_utils.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/widgets/sura_list_tile.dart';

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
        itemCount: SuraModel.suraList.length,
      ),
    );
    
  }
}