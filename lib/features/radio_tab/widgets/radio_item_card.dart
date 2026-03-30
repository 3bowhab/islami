import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/radio_tab/view_model/radio_view_model.dart';

class RadioItemCard extends StatelessWidget {
  final RadioViewModel radioViewModel;
  final int index;

  const RadioItemCard({
    super.key,
    required this.radioViewModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final radio = radioViewModel.radios[index];

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppUtils.height(context) * (8 / 932),
      ),
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
              (radioViewModel.currentPlayingId != null &&
                      radioViewModel.currentPlayingId == radio.url &&
                      radioViewModel.isPlaying == true)
                  ? Assets.imagesSoundWave
                  : Assets.imagesImgBottomDecoration,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppUtils.height(context) * (12 / 932),
              ),
              child: Column(
                children: [
                  Text(radio.name ?? '', style: AppTextStyles.blackBold(16)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage(Assets.iconsPause),
                        size: 30,
                        color: Colors.transparent,
                      ),
                      SizedBox(width: AppUtils.width(context) * (20 / 468)),
                      _buildPlayPauseButton(),
                      SizedBox(width: AppUtils.width(context) * (20 / 468)),
                      _buildMuteButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    final radio = radioViewModel.radios[index];
    return GestureDetector(
      onTap: () => radioViewModel.play(radio.url ?? ''),
      child: SizedBox(
        width: 30,
        height: 30,
        child:
            (radioViewModel.currentPlayingId == radio.url &&
                radioViewModel.isBuffering)
            ? const CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.black,
              )
            : ImageIcon(
                AssetImage(
                  (radioViewModel.currentPlayingId == radio.url &&
                          radioViewModel.isPlaying == true)
                      ? Assets.iconsPause
                      : Assets.iconsPlay,
                ),
                size: 30,
                color: AppColors.black,
              ),
      ),
    );
  }

  Widget _buildMuteButton() {
    final radio = radioViewModel.radios[index];
    return GestureDetector(
      onTap: () {
        radioViewModel.muteAudio(
          radioViewModel.currentVolume == 2.0 ? 0.0 : 2.0,
          radio.url ?? '',
        );
      },
      child: ImageIcon(
        AssetImage(
          (radioViewModel.currentPlayingId != null &&
                  radioViewModel.currentPlayingId == radio.url &&
                  radioViewModel.currentVolume == 0.0)
              ? Assets.iconsVolumeCross
              : Assets.iconsVolumeHigh,
        ),
      ),
    );
  }
}
