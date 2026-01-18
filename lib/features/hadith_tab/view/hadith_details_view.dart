import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/data/models/hadith_model.dart';

class HadithDetailsView extends StatelessWidget {
  const HadithDetailsView({super.key});


  @override
  Widget build(BuildContext context) {
    final hadith = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      appBar: AppBar(title: Text('Hadith ${hadith.index + 1}', style: AppTextStyles.goldBold(20),)),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              Assets.imagesSouraDetailsScreen,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            if (hadith.content.isEmpty)
              Center(child: CircularProgressIndicator(color: AppColors.gold))
            else
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: AppUtils.height(context) * (8 / 932)),
                    Center(
                      child: Text(
                        hadith.title,
                        style: AppTextStyles.goldBold(24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppUtils.width(context) * (20 / 430),
                        vertical: AppUtils.height(context) * (50 / 932),
                      ),
                      child:Text(
                        hadith.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.goldBold(20),
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
}