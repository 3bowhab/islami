import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';

class RadioCard extends StatefulWidget {
  const RadioCard({
    super.key,
    required this.radioStations,
    required this.index,
  });

  final List<String> radioStations;
  final int index;

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  bool isPlaying = false;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: AppUtils.height(context) * (8 / 932)),
      child: Container(
        height: AppUtils.height(context) * (133 / 932),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              isPlaying
                  ? Assets.imagesSoundWave
                  : Assets.imagesImgBottomDecoration,
            ),
            Padding(
              padding: .symmetric(vertical: AppUtils.height(context) * (12 / 932)),
              child: Column(
                children: [
                  Text(
                    widget.radioStations[widget.index],
                    style: AppTextStyles.blackBold(20),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage(Assets.iconsPause),
                        size: 30,
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        width: AppUtils.width(context) * (20 / 468),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        child: ImageIcon(
                          AssetImage(isPlaying ? Assets.iconsPause : Assets.iconsPlay),
                          size: 30,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: AppUtils.width(context) * (20 / 468)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMuted = !isMuted;
                          });
                        },
                        child: ImageIcon(
                          AssetImage(isMuted ? Assets.iconsVolumeCross : Assets.iconsVolumeHigh),
                          size: 30,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
