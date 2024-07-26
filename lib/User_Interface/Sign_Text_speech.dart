import 'package:camera_application/Controllers/Sign_Text_speech_logic.dart';
import 'package:flutter/material.dart';
import 'package:camera_application/User_Interface/dropDownUI.dart';
import '../camera_view.dart';

class SignLanguageTranslatorScreen extends StatefulWidget {
  const SignLanguageTranslatorScreen({super.key});

  @override
  _SignLanguageTranslatorScreenState createState() =>
      _SignLanguageTranslatorScreenState();
}

class _SignLanguageTranslatorScreenState
    extends State<SignLanguageTranslatorScreen> {
  final SignLanguageTranslatorLogic _logic = SignLanguageTranslatorLogic();

  @override
  void dispose() {
    _logic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                      child: CameraView(key: _logic.cameraViewKey),
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
                                color: Colors.black,
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
                                onPressed: _logic.playAudio,
                              ),
                              IconButton(
                                icon: const Icon(Icons.pause),
                                onPressed: _logic.pauseAudio,
                              ),
                              IconButton(
                                icon: const Icon(Icons.stop),
                                onPressed: _logic.stopAudio,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () => _logic.startCountdown(setState),
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
                        child: Text(_logic.isDetecting
                            ? _logic.countdown > 0
                                ? 'Translate (${_logic.countdown})'
                                : 'Detecting (15)'
                            : 'Translate'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DropDownContainer(),
          ],
        ),
      ),
    );
  }
}
