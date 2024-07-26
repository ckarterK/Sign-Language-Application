import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../camera_view.dart';

class SignLanguageTranslatorLogic {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isDetecting = false;
  int _countdown = 4;
  Timer? _timer;
  final GlobalKey<CameraViewState> _cameraViewKey = GlobalKey<CameraViewState>();

  bool get isDetecting => _isDetecting;
  int get countdown => _countdown;

  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel();
  }

  void startCountdown(Function setState) {
    if (_isDetecting) return;

    _isDetecting = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        setState(() {
          _countdown = 4;
        });
        _startObjectDetection(setState);
      }
    });
  }

  void _startObjectDetection(Function setState) {
    final cameraView = _cameraViewKey.currentState;
    if (cameraView != null) {
      cameraView.startObjectDetection();
      Timer(Duration(seconds: 15), () {
        cameraView.stopObjectDetection();
        setState(() {
          _isDetecting = false;
        });
      });
    }
  }

  Future<void> playAudio() async {
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    await _audioPlayer.play(UrlSource(url));
  }

  void pauseAudio() {
    _audioPlayer.pause();
  }

  void stopAudio() {
    _audioPlayer.stop();
  }

  GlobalKey<CameraViewState> get cameraViewKey => _cameraViewKey;
}
