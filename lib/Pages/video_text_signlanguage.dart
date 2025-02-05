import 'package:camera_application/Pages/Sign_Text_speech.dart';
import 'package:camera_application/Pages/speech_text_sign.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoTextSignLanguageWidget extends StatefulWidget {
  const VideoTextSignLanguageWidget({Key? key}) : super(key: key);

  @override
  State<VideoTextSignLanguageWidget> createState() =>
      _VideoTextSignLanguageWidgetState();
}

class _VideoTextSignLanguageWidgetState
    extends State<VideoTextSignLanguageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedOption1;
  String? _selectedOption2;
  
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          width: 290.0,
                          height: 51.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 3.0,
                              side: const BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Upload Video',
                              style: GoogleFonts.readexPro(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 134.0,
                                  height: 4.0,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  'Translations',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 22.0,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Container(
                                  width: 128.0,
                                  height: 4.0,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          'Text',
                          style: GoogleFonts.readexPro(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          child: Container(
                            height: 167.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          'Sign Language',
                          style: GoogleFonts.readexPro(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          child: Container(
                            height: 180.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1.0),
                            ),
                          ),
                        ),
                      ),Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
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
                        child: const Text(
                          'Translate',
                          style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            color:Colors.black,
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
