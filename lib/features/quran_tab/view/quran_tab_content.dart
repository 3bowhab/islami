import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/config/sura_details_config.dart';
import 'package:islami/data/models/sura_model.dart';
import 'package:islami/data/service/prefs_service.dart';
import 'package:islami/features/quran_tab/widgets/most_recently.dart';
import 'package:islami/features/quran_tab/widgets/search_field.dart';
import 'package:islami/features/quran_tab/widgets/suras_list.dart';
import 'package:islami/main.dart';

class QuranTabContent extends StatefulWidget {
  const QuranTabContent({super.key});

  @override
  State<QuranTabContent> createState() => _QuranTabContentState();
}

class _QuranTabContentState extends State<QuranTabContent> with RouteAware {
  List<SuraModel> filterList = [];
  List<int> mostRecent = [];

  @override
  void initState() {
    super.initState();
    filterList = SuraDetailsConfig.suraList;
    loadMostRecent();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    loadMostRecent();
  }

  void loadMostRecent() async {
    mostRecent = await PrefsService.getMostRecentSuraList();
    setState(() {});
  }

  void onchanged(String text) {
    setState(() {
      filterList = SuraDetailsConfig.suraList.where((sura) {
        return sura.arabicName.contains(text) ||
            sura.englishName.toLowerCase().contains(text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(child: Image.asset(Assets.imagesIslami)),
        ),

        SliverToBoxAdapter(child: SearchField(onChanged: onchanged)),

        sizedBox(context),
        sizedBox(context),

        /// Title
        SliverToBoxAdapter(
          child: Text('Most Recently', style: AppTextStyles.offWhiteBold(16)),
        ),

        sizedBox(context),

        /// Horizontal List
        SliverToBoxAdapter(child: MostRecently(mostRecentSuras: mostRecent)),

        sizedBox(context),

        /// Suras List (Vertical)
        SurasList(filterList: filterList),
      ],
    );
  }

  SliverToBoxAdapter sizedBox(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(height: AppUtils.height(context) * (10 / 932)),
    );
  }
}
