import 'package:camera_application/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() async {
  await initializeCameras();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Language Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Readex Pro',
      ),
      home: const SignLanguageTranslatorScreen(),
    );
  }
}

class SignLanguageTranslatorScreen extends StatefulWidget {
  const SignLanguageTranslatorScreen({super.key});

  @override
  _SignLanguageTranslatorScreenState createState() =>
      _SignLanguageTranslatorScreenState();
}

class _SignLanguageTranslatorScreenState
    extends State<SignLanguageTranslatorScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio() async {
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    await _audioPlayer.play(UrlSource(url));
    print('Audio playing');
  }

  void _pauseAudio() {
    _audioPlayer.pause();
  }

  void _stopAudio() {
    _audioPlayer.stop();
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
                color: Colors.grey[300],
                width: 415,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 20),
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          'Sign Language',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.black),
                      ),
                      child: const CameraView(),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Translations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
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
                      padding: const EdgeInsets.only(top: 10), // Padding above the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your button press logic here
                        },
                        child: const Text('Translate'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 415,
              height: 98,
              decoration: const BoxDecoration(
                color: Color(0xFF900000),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButton<String>(
                        value: 'Option 1',
                        onChanged: (String? newValue) {},
                        items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
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
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButton<String>(
                      value: 'Option 1',
                      onChanged: (String? newValue) {},
                      items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
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
}
