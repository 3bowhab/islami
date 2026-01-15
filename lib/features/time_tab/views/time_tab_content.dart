import 'package:flutter/material.dart';
import 'package:islami/features/time_tab/widgets/pray_time.dart';

class TimeTabContent extends StatelessWidget {
  const TimeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PrayTime(),
      ],
    );
  }
}
