import 'package:flutter/material.dart';
import 'package:islami/helper/app_utils.dart';
import 'package:islami/widgets/most_recently_item.dart';

class MostRecently extends StatelessWidget {
  const MostRecently({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppUtils.height(context) * (150 / 932),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: AppUtils.width(context) * (10 / 430),
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MostRecentlyItem();
        },
      ),
    );
  }
}