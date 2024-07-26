import 'dart:async';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextLogic extends ChangeNotifier {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;
  String _recognizedText = '';
  bool _isCountingDown = false;
  int _countdownValue = 5;
  String _buttonText = 'Translate';
  Color _iconContainerColor = Colors.white;
  Color _iconColor = Colors.black;

  bool get isListening => _isListening;
  String get recognizedText => _recognizedText;
  bool get isCountingDown => _isCountingDown;
  int get countdownValue => _countdownValue;
  String get buttonText => _buttonText;
  Color get iconContainerColor => _iconContainerColor;
  Color get iconColor => _iconColor;

  Future<bool> initSpeech() async {
    bool initialized = await _speechToText.initialize();
    notifyListeners();
    return initialized;
  }

  Future<void> startCountdown(Function onCountdownComplete) async {
    if (!(await initSpeech())) {
      throw SpeechToTextNotInitializedException('SpeechToText not initialized');
    }
    _isCountingDown = true;
    _countdownValue = 5;
    _buttonText = 'Countdown: $_countdownValue';
    notifyListeners();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdownValue > 1) {
        _countdownValue--;
        _buttonText = 'Countdown: $_countdownValue';
        notifyListeners();
      } else {
        timer.cancel();
        onCountdownComplete();
      }
    });
  }

  Future<void> startListening(Function onResult, Function onListeningComplete) async {
    if (!(await initSpeech())) {
      throw SpeechToTextNotInitializedException('SpeechToText not initialized');
    }
    _iconContainerColor = Colors.red;
    _iconColor = Colors.white;
    _countdownValue = 10;
    _buttonText = 'Listening... $_countdownValue';
    notifyListeners();

    _speechToText.listen(onResult: (result) {
      _recognizedText = result.recognizedWords;
      notifyListeners();
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdownValue > 1) {
        _countdownValue--;
        _buttonText = 'Listening... $_countdownValue';
        notifyListeners();
      } else {
        timer.cancel();
        stopListening();
        onListeningComplete();
      }
    });
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    _iconContainerColor = Colors.white;
    _iconColor = Colors.black;
    _isCountingDown = false;
    _buttonText = 'Translate';
    notifyListeners();
  }

  @override
  void dispose() {
    _speechToText.stop();
    _speechToText.cancel();
    super.dispose();
  }
}

class SpeechToTextNotInitializedException implements Exception {
  final String message;
  SpeechToTextNotInitializedException(this.message);
  @override
  String toString() => message;
}
