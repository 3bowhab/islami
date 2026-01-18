import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/models/hadith_model.dart';
import 'package:islami/features/hadith_tab/widgets/hadith_card.dart';

class HadithTabContent extends StatefulWidget {
  const HadithTabContent({super.key});

  @override
  State<HadithTabContent> createState() => _HadithTabContentState();
}

class _HadithTabContentState extends State<HadithTabContent> {
  final List<HadithModel> hadithList = [];

  @override
  void initState() {
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(Assets.imagesIslami)),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.only(bottom: AppUtils.height(context) * (20 / 932),
            ),
            child: CarouselSlider.builder(
              itemCount: hadithList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      HadithCard(hadithList: hadithList, itemIndex: itemIndex),
              options: CarouselOptions(
                height: double.infinity,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loadHadithFile() async {
    for (var i = 1; i <= 50; i++) {
      String hadithContent = await rootBundle.loadString(
        'assets/files/hadith/h$i.txt',
      );
      List<String> lines = hadithContent.trim().split('\n');
      String hadithTitle = lines[0];
      lines.removeAt(0);
      hadithList.add(HadithModel(title: hadithTitle, content: lines));
    }
    setState(() {});
  }
}