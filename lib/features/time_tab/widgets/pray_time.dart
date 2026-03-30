import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/radio_tab/widgets/custom_error_widget.dart';
import 'package:islami/features/radio_tab/widgets/custom_loading_widget.dart';
import 'package:islami/features/radio_tab/widgets/empty_widget.dart';
import 'package:islami/features/time_tab/logic/time_view_model.dart';
import 'package:islami/features/time_tab/widgets/pray_time_body.dart';
import 'package:islami/features/time_tab/widgets/pray_time_header.dart';
import 'package:provider/provider.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeViewModel()..fetchAdhanData(),
      child: Consumer<TimeViewModel>(
        builder: (context, timeViewModel, child) {
          if (timeViewModel.isLoading) {
            return const CustomLoadingWidget();
          } else if (timeViewModel.errorMessage.isNotEmpty) {
            return CustomErrorWidget(errorMessage: timeViewModel.errorMessage);
          } else if (timeViewModel.adhanTimes != null) {
            return Container(
              height: AppUtils.height(context) * (300 / 932),
              decoration: BoxDecoration(
                color: AppColors.lightBrown,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  PrayTimeHeader(timeViewModel: timeViewModel),
                  PrayTimeBody(timeViewModel: timeViewModel),
                ],
              ),
            );
          } else {
            return const EmptyWidget();
          }
        },
      ),
    );
  }
}

// class PrayTime extends StatelessWidget {
//   const PrayTime({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: AppUtils.height(context) * (300 / 932),
//       decoration: BoxDecoration(
//         color: AppColors.lightBrown,
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Column(
//         children: [
//           PrayTimeHeader(),
//           PrayTimeBody(),
//         ],
//       ),
//     );
//   }
// }
