import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/models/sura_model.dart';

class SouraDetailsView extends StatefulWidget {
  const SouraDetailsView({super.key});

  @override
  State<SouraDetailsView> createState() => _SouraDetailsViewState();
}

class _SouraDetailsViewState extends State<SouraDetailsView> {
  List<String> suraVerses = [];
  late SuraModel sura;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadSuraFile(sura.suraNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    loadSuraFile(sura.suraNum);

    return Scaffold(
      appBar: AppBar(title: Text(sura.englishName)),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              Assets.imagesSouraDetailsScreen,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            if (suraVerses.isEmpty)
              Center(child: CircularProgressIndicator(color: AppColors.gold))
            else
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: AppUtils.height(context) * (8 / 932)),
                    Center(
                      child: Text(
                        sura.arabicName,
                        style: AppTextStyles.goldBold(24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppUtils.width(context) * (20 / 430),
                        vertical: AppUtils.height(context) * (50 / 932),
                      ),
                      child: Text.rich(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,

                        TextSpan(
                          children: [
                            for (int i = 0; i < suraVerses.length; i++) ...[
                              TextSpan(
                                text: suraVerses[i],
                                style: AppTextStyles.goldBold(20),
                              ),
                              TextSpan(
                                text: '[${i + 1}]',
                                style: AppTextStyles.goldBold(20),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String suraContent = await rootBundle.loadString(
      'assets/files/sura/${index + 1}.txt',
    );
    setState(() {
      suraVerses = suraContent.trim().split('\n');
    });
  }
}
