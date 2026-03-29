import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_utils.dart';
import 'package:islami/features/radio_tab/view_model/radio_view_model.dart';
import 'package:islami/features/radio_tab/widgets/radio_item_card.dart';

class RadioList extends StatelessWidget {
  final RadioViewModel radioViewModel;
  const RadioList({super.key, required this.radioViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppUtils.height(context) * (8 / 932),
      ),
      child: ListView.builder(
        itemCount: radioViewModel.radios.length,
        itemBuilder: (context, index) {
          return RadioItemCard(radioViewModel: radioViewModel, index: index);
        },
      ),
    );
  }
}
