import 'package:flutter/material.dart';
import 'package:islami/features/radio_tab/view_model/radio_view_model.dart';
import 'package:islami/features/radio_tab/widgets/custom_error_widget.dart';
import 'package:islami/features/radio_tab/widgets/empty_widget.dart';
import 'package:islami/features/radio_tab/widgets/custom_loading_widget.dart';
import 'package:islami/features/radio_tab/widgets/radio_list.dart';
import 'package:provider/provider.dart';

class RadioCards extends StatelessWidget {
  const RadioCards({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RadioViewModel()..fetchRadioData(),
      child: Consumer<RadioViewModel>(
        builder: (context, radioViewModel, child) {
          if (radioViewModel.isLoading) {
            return const CustomLoadingWidget();
          } else if (radioViewModel.errorMessage.isNotEmpty) {
            return CustomErrorWidget(errorMessage: radioViewModel.errorMessage);
          } else if (radioViewModel.radios.isNotEmpty) {
            return RadioList(radioViewModel: radioViewModel);
          } else {
            return const EmptyWidget();
          }
        },
      ),
    );
  }
}