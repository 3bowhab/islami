import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/constants/app_routes.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/models/sura_model.dart';
import 'package:islami/data/service/prefs_service.dart';

class SuraListTile extends StatelessWidget {
  final int index;
  final List<SuraModel> filterList;
  final VoidCallback onReturn;
  const SuraListTile({super.key, required this.index, required this.filterList, required this.onReturn});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        PrefsService.saveNewSuraList(filterList[index].suraNum);
        await Navigator.pushNamed(context, AppRoutes.souraDetailsView, arguments: filterList[index]);
        onReturn();
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: AppUtils.width(context) * (70 / 430),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSuraNumber),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text('${filterList[index].suraNum + 1}', style: AppTextStyles.whiteBold(16)),
        ),
      ),
      title: Text(
        filterList[index].englishName,
        style: AppTextStyles.whiteBold(20),
      ),
      subtitle: Text(
        "${filterList[index].ayaCount} Verses",
        style: AppTextStyles.whiteBold(14),
      ),
      trailing: Text(
        filterList[index].arabicName,
        style: AppTextStyles.whiteBold(20),
      ),
    );
  }
}
