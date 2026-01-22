import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';

class SebhaCounter extends StatefulWidget {
  const SebhaCounter({super.key});

  @override
  State<SebhaCounter> createState() => _SebhaCounterState();
}

class _SebhaCounterState extends State<SebhaCounter> {
  int counter = 0;
  int index = 0;
  double angle = 1;
  List<String> tasbeehWords = ['سبحان الله', 'الحمد لله', 'الله أكبر', 'لا إله إلا الله'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (counter == 32) {
            counter = 0;
            index = (index + 1) % tasbeehWords.length;
          } else {
            counter++;
          }
          angle += 1;
        });
      },
      child: Stack(
        alignment: .topCenter,
        children: [
          Image.asset(Assets.imagesSebhaHead),
          Padding(
            padding: EdgeInsets.only(
              top: AppUtils.height(context) * (75 / 932),
            ),
            child: Stack(
              alignment: .center,
              children: [
                Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    Assets.imagesSebhaBody,
                    width: AppUtils.width(context) * (380 / 430),
                  ),
                ),
                Column(
                  spacing: 10,
                  children: [
                    Text(
                      tasbeehWords[index],
                      style: AppTextStyles.whiteBold(32),
                    ),
                    Text('$counter', style: AppTextStyles.whiteBold(32)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
