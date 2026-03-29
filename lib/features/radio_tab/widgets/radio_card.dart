// import 'package:flutter/material.dart';
// import 'package:islami/core/theme/app_colors.dart';
// import 'package:islami/core/constants/app_images.dart';
// import 'package:islami/core/theme/app_text_styles.dart';
// import 'package:islami/core/utils/app_utils.dart';
// import 'package:islami/data/models/radio_model/radio.dart';
// import 'package:islami/features/radio_tab/view_model/radio_view_model.dart';
// import 'package:provider/provider.dart';

// class RadioCard extends StatefulWidget {
//   const RadioCard({
//     super.key,
//     required this.radioStations,
//     required this.index,
//   });

//   final RadioItem radioStations;
//   final int index;

//   @override
//   State<RadioCard> createState() => _RadioCardState();
// }

// class _RadioCardState extends State<RadioCard> {
//   @override
//   Widget build(BuildContext context) {
//     final vm = context.watch<RadioViewModel>();

//     return Padding(
//       padding: .symmetric(vertical: AppUtils.height(context) * (8 / 932)),
//       child: Container(
//         height: AppUtils.height(context) * (133 / 932),
//         decoration: BoxDecoration(
//           color: AppColors.gold,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Image.asset(
              
//                   ? Assets.imagesSoundWave
//                   : Assets.imagesImgBottomDecoration,
//             ),
//             Padding(
//               padding: .symmetric(
//                 vertical: AppUtils.height(context) * (12 / 932),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     widget.radioStations.name ?? '',
//                     style: AppTextStyles.blackBold(16),
//                   ),
//                   Spacer(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ImageIcon(
//                         AssetImage(Assets.iconsPause),
//                         size: 30,
//                         color: Colors.transparent,
//                       ),
//                       SizedBox(width: AppUtils.width(context) * (20 / 468)),
//                       GestureDetector(
//                         onTap: () => vm.togglePlay(widget.index),
//                         child: ImageIcon(
//                           AssetImage(
//                             vm.currentPlayingId == widget.radioStations.id && vm.isPlaying
//                                 ? Assets.iconsPause
//                                 : Assets.iconsPlay,
//                           ),
//                           size: 30,
//                           color: AppColors.black,
//                         ),
//                       ),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     setState(() {
//                       //       isPlaying = !isPlaying;
//                       //     });
//                       //     vm.togglePlay(widget.index);
//                       //   },
//                       //   child: ImageIcon(
//                       //     AssetImage(
//                       //       isPlaying ? Assets.iconsPause : Assets.iconsPlay,
//                       //     ),
//                       //     size: 30,
//                       //     color: AppColors.black,
//                       //   ),
//                       // ),
//                       SizedBox(width: AppUtils.width(context) * (20 / 468)),
//                       GestureDetector(
//                         onTap: vm.toggleMute,
//                         child: ImageIcon(
//                           AssetImage(
//                             vm.isMuted
//                                 ? Assets.iconsVolumeCross
//                                 : Assets.iconsVolumeHigh,
//                           ),
//                         ),
//                       ),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     setState(() {
//                       //       isMuted = !isMuted;
//                       //     });
//                       //     vm.toggleMute();
//                       //   },
//                       //   child: ImageIcon(
//                       //     AssetImage(
//                       //       isMuted
//                       //           ? Assets.iconsVolumeCross
//                       //           : Assets.iconsVolumeHigh,
//                       //     ),
//                       //     size: 30,
//                       //     color: AppColors.black,
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
