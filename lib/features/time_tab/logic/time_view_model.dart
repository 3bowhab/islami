import 'package:flutter/material.dart';
import 'package:islami/data/api/api_manager.dart';
import 'package:islami/data/models/adhan_model/timings.dart';

class TimeViewModel extends ChangeNotifier {
  Timings? adhanTimes;
  String errorMessage = '';
  bool isLoading = false;

  // Fetch adhan data from API
  Future<void> fetchAdhanData() async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      final adhanResponse = await ApiManager().getAdhanData();
      adhanTimes = adhanResponse.data?.timings;
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}