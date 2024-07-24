import 'dart:async';

import 'package:camera_application/Pages/speech_text_sign.dart';
import 'package:camera_application/Pages/video_text_signlanguage.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../camera_view.dart'; // Import the CameraView

class SignLanguageTranslatorScreen extends StatefulWidget {
  const SignLanguageTranslatorScreen({super.key});

  @override
  _SignLanguageTranslatorScreenState createState() =>
      _SignLanguageTranslatorScreenState();
}

class _SignLanguageTranslatorScreenState
    extends State<SignLanguageTranslatorScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isDetecting = false;
  int _countdown = 4;
  Timer? _timer;
  final GlobalKey<CameraViewState> _cameraViewKey = GlobalKey<CameraViewState>();
  String? _selectedOption1;
  String? _selectedOption2;
  @override
  void dispose() {
    debugPrint('Disposing audio player...');
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    if (_isDetecting) return;

    setState(() {
      _isDetecting = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        setState(() {
          _countdown = 4;
          _isDetecting = false;
        });
        _startObjectDetection();
      }
    });
  }

  void _startObjectDetection() {
    final cameraView = _cameraViewKey.currentState;
    if (cameraView != null) {
      cameraView.startObjectDetection();
    }
  }

  void _playAudio() async {
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    await _audioPlayer.play(UrlSource(url));
    debugPrint('Audio playing');
  }

  void _pauseAudio() {
    debugPrint('Pausing audio...');
    _audioPlayer.pause();
  }

  void _stopAudio() {
    debugPrint('Stopping audio...');
    _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building SignLanguageTranslatorScreen...');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                 padding: const EdgeInsetsDirectional.fromSTEB(0,20,0,0),
                color: Colors.grey[300],
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 300,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.black),
                      ),
                      child: CameraView(key: _cameraViewKey),
                    ),
                     Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: SizedBox(
                        width: 418.0,
                        height: 47.0,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top: 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 134.0,
                                height: 4.0,
                                color:Colors.black,
                              ),
                              const Align(
                                alignment: AlignmentDirectional.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    'Translations',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 136.6,
                                height: 4.0,
                                 color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                        child: Text(
                          'Text Translation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 375,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(child: Text('Text Output Area')),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                        child: Text(
                          'Speech/Audio',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 370,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(child: Text('Audio')),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.play_arrow),
                                onPressed: _playAudio,
                              ),
                              IconButton(
                                icon: const Icon(Icons.pause),
                                onPressed: _pauseAudio,
                              ),
                              IconButton(
                                icon: const Icon(Icons.stop),
                                onPressed: _stopAudio,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20), // Padding above the button
                      child: ElevatedButton(
                        onPressed: _startCountdown,
                        child: Text('Translate ($_countdown)'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          elevation: 3.0,
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: 98,
                decoration: const BoxDecoration(
                  color: Color(0xFF900000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Container(
                        width: 170,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownButton<String>(
                          hint: Text('From'),
                          value: _selectedOption1,
                          onChanged: (String? masterDropdown) {
                            setState(() {
                              _selectedOption1 = masterDropdown;
                              if (masterDropdown == 'Video') {
                                _navigateToVideoTextSignLanguage();
                              }
                              if (masterDropdown == 'Sign Language'){
                                _navigateToSignLanguageTextSpeech();
                              }else if(masterDropdown == 'Speech'){
                                _navigateToSpeechTextSignLanguage();
                              }
                            });
                          },
                          items: <String>['Sign Language', 'Video', 'Speech']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          dropdownColor: Colors.white,
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          underline: Container(
                            height: 2,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    ),
                    Container(
                      width: 170,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButton<String>(
                        hint: Text('To'),
                        value: _selectedOption2,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption2 = newValue;
                          });
                        },
                        items: <String>['text & speech', 'Text & Sign', 'Text & Sign']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        dropdownColor: Colors.white,
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
  void _navigateToVideoTextSignLanguage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VideoTextSignLanguageWidget()),
    );
  }
   void _navigateToSignLanguageTextSpeech() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignLanguageTranslatorScreen()),
    );
  }
   void _navigateToSpeechTextSignLanguage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SpeechTextSign()),
    );
  }
}
