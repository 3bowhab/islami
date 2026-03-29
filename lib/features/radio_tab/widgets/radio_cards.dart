import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/radio_tab/view_model/radio_view_model.dart';
import 'package:provider/provider.dart';

class RadioCards extends StatelessWidget {
  const RadioCards({super.key, required this.currentIndex});
  final int currentIndex;

  // final List<String> radioStations = [
  //   'Radio Ibrahim Al-Akdar',
  //   'Radio Al-Qaria Yassen',
  //   'Radio Ahmed Al-trabulsi',
  //   'Radio Addokali Mohammad Alalim',
  //   'Radio Abdelbasset Abdessamad',
  // ];

  // final List<String> recitersStations = [
  //   'Ibrahim Al-Akdar',
  //   'Al-Qaria Yassen',
  //   'Ahmed Al-trabulsi',
  //   'Addokali Mohammad Alalim',
  //   'Abdelbasset Abdessamad',
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RadioViewModel()..fetchRadioData(),
      child: Consumer<RadioViewModel>(
        builder: (context, radioViewModel, child) {
          if (radioViewModel.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.gold),
            );
          } else if (radioViewModel.errorMessage.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(radioViewModel.errorMessage)],
              ),
            );
          } else if (radioViewModel.radios.isNotEmpty) {
            return Padding(
              padding: .symmetric(
                vertical: AppUtils.height(context) * (8 / 932),
              ),
              child: ListView.builder(
                itemCount: radioViewModel.radios.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: .symmetric(
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
                                    radioViewModel.currentPlayingId ==
                                        radioViewModel.radios[index].url &&
                                    radioViewModel.isPlaying == true)
                                ? Assets.imagesSoundWave
                                : Assets.imagesImgBottomDecoration,
                          ),
                          Padding(
                            padding: .symmetric(
                              vertical: AppUtils.height(context) * (12 / 932),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  // widget.radioStations.name ?? '',
                                  radioViewModel.radios[index].name ?? '',
                                  style: AppTextStyles.blackBold(16),
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
                                      width:
                                          AppUtils.width(context) * (20 / 468),
                                    ),
                                    GestureDetector(
                                      onTap: () => radioViewModel.play(
                                        radioViewModel.radios[index].url ?? '',
                                      ),
                                      child: SizedBox(
                                        width:
                                            30, // تثبيت الحجم عشان الكارت ميهزش
                                        height: 30,
                                        child:
                                            (radioViewModel.currentPlayingId ==
                                                    radioViewModel.radios[index].url &&
                                                radioViewModel.isBuffering)
                                            ? const CircularProgressIndicator(
                                                strokeWidth:
                                                    2, // خليه رفيع عشان الحجم صغير
                                                color: AppColors.black,
                                              )
                                            : ImageIcon(
                                                AssetImage(
                                                  (radioViewModel.currentPlayingId ==
                                                              radioViewModel.radios[index]
                                                                  .url &&
                                                          radioViewModel
                                                                  .isPlaying ==
                                                              true)
                                                      ? Assets.iconsPause
                                                      : Assets.iconsPlay,
                                                ),
                                                size: 30,
                                                color: AppColors.black,
                                              ),
                                      ),
                                    ),
                                    // GestureDetector(
                                    //   onTap: () => radioViewModel.play(
                                    //     radioViewModel.radios[index].url ?? '',
                                    //   ),
                                    //   child: ImageIcon(
                                    //     AssetImage(
                                    //       (radioViewModel.currentPlayingId !=
                                    //                   null &&
                                    //               radioViewModel
                                    //                       .currentPlayingId ==
                                    //                   radioViewModel
                                    //                       .radios[index]
                                    //                       .url &&
                                    //               radioViewModel.isPlaying ==
                                    //                   true)
                                    //           ? Assets.iconsPause
                                    //           : Assets.iconsPlay,
                                    //     ),
                                    //     size: 30,
                                    //     color: AppColors.black,
                                    //   ),
                                    // ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       isPlaying = !isPlaying;
                                    //     });
                                    //     vm.togglePlay(widget.index);
                                    //   },
                                    //   child: ImageIcon(
                                    //     AssetImage(
                                    //       isPlaying ? Assets.iconsPause : Assets.iconsPlay,
                                    //     ),
                                    //     size: 30,
                                    //     color: AppColors.black,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width:
                                          AppUtils.width(context) * (20 / 468),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        radioViewModel.muteAudio(
                                          radioViewModel.currentVolume == 2.0
                                              ? 0.0
                                              : 2.0,
                                          radioViewModel.radios[index].url ??
                                              '',
                                        );
                                      },
                                      child: ImageIcon(
                                        AssetImage(
                                          (radioViewModel.currentPlayingId !=
                                                      null &&
                                                  radioViewModel
                                                          .currentPlayingId ==
                                                      radioViewModel
                                                          .radios[index]
                                                          .url &&
                                                  radioViewModel
                                                          .currentVolume ==
                                                      0.0)
                                              ? Assets.iconsVolumeCross
                                              : Assets.iconsVolumeHigh,
                                        ),
                                      ),
                                    ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       isMuted = !isMuted;
                                    //     });
                                    //     vm.toggleMute();
                                    //   },
                                    //   child: ImageIcon(
                                    //     AssetImage(
                                    //       isMuted
                                    //           ? Assets.iconsVolumeCross
                                    //           : Assets.iconsVolumeHigh,
                                    //     ),
                                    //     size: 30,
                                    //     color: AppColors.black,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text('there is no radios to show, please try again later'),
            );
          }
        },
      ),
    );
  }
}
