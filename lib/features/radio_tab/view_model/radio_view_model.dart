import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/data/api/api_manager.dart';
import 'package:islami/data/models/radio_model/radio.dart';
import 'package:just_audio/just_audio.dart';

class RadioViewModel extends ChangeNotifier {
  List<RadioItem> radios = [];
  String errorMessage = '';
  bool isLoading = false;

  late final AudioPlayer player;
  bool isBuffering = false;
  bool _isDisposed = false;
  String? _currentPlayingId;
  bool? _isPlaying;
  double? _currentVolume = 2.0;

  String? get currentPlayingId => _currentPlayingId;
  bool? get isPlaying => _isPlaying;
  double? get currentVolume => _currentVolume;

  RadioViewModel() {
    player = AudioPlayer();

    player.playbackEventStream.listen((event) {
      isBuffering =
          player.processingState == ProcessingState.buffering ||
          player.processingState == ProcessingState.loading;
      notifyListeners();
    });

    player.playingStream.listen((state) {
      _isPlaying = state;
      notifyListeners();
    });
  }

  // Fetch radio data from API
  Future<void> fetchRadioData() async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      final radioResponse = await ApiManager().getRadioData();
      radios = radioResponse.radios ?? [];
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // play the audio
  Future<void> play(String url) async {
    try {
      if (currentPlayingId == url) {
        if (_isPlaying == true) {
          await player.pause();
        } else {
          await player.play();
        }
      } else {
        await player.stop();
        _currentPlayingId = url;
        await player.setUrl(url);
        await player.play();

        _currentPlayingId = url;
      }

      notifyListeners();
    } catch (e) {
      errorMessage = "Error playing radio";
      notifyListeners();
    }
  }

  // stop the audio
  Future<void> stop(String url) async {
    if (currentPlayingId == url) {
      await player.stop();
      _currentPlayingId = null;
      notifyListeners(); 
    }
  }

  Future<void> muteAudio(double volume, String url) async {
    if (currentPlayingId == url) {
      _currentVolume = volume;
      await player.setVolume(volume);
      notifyListeners();
    }
  }
  

  @override
  void dispose() {
    _isDisposed = true;
    player.dispose();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }
}
