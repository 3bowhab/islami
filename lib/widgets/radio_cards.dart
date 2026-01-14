import 'package:flutter/material.dart';
import 'package:islami/helper/app_utils.dart';
import 'package:islami/widgets/radio_card.dart';

class RadioCards extends StatelessWidget {
  RadioCards({super.key, required this.currentIndex});
  final int currentIndex; 

  final List<String> radioStations = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
    'Radio Abdelbasset Abdessamad',
  ];

  final List<String> recitersStations = [
    'Ibrahim Al-Akdar',
    'Al-Qaria Yassen',
    'Ahmed Al-trabulsi',
    'Addokali Mohammad Alalim',
    'Abdelbasset Abdessamad',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: AppUtils.height(context) * (8 / 932)),
      child: ListView.builder(
        itemCount: currentIndex==0 ? radioStations.length : recitersStations.length,
        itemBuilder: (context, index) {
          return RadioCard(radioStations: currentIndex == 0 ? radioStations : recitersStations, index: index);
        },
      ),
    );
  }
}