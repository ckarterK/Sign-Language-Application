import 'package:camera_application/Pages/Sign_Text_speech.dart';
import 'package:camera_application/Pages/speech_text_sign.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../camera_view.dart';
import 'video_text_signlanguage.dart'; // Import your VideoTextSignLanguageWidget

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Language Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Readex Pro',
      ),
      home: const HomePage(), // Set HomePage as the initial route
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedOption1;
  String? _selectedOption2;

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



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 743.5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'SignSpeak',
                          style: GoogleFonts.readexPro(
                            textStyle: const TextStyle(
                              fontSize: 64.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Bridging Conversations Beyond Words',
                          style: TextStyle(
                            fontSize: 19.0,
                            letterSpacing: 0.0,
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
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption1 = newValue;
                              if (newValue == 'Video') {
                                _navigateToVideoTextSignLanguage();
                              }
                              if (newValue== 'Sign Language'){
                                _navigateToSignLanguageTextSpeech();
                              }else if(newValue== 'Speech'){
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
      ),
    );
  }
}
