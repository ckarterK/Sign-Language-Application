import 'package:camera_application/Pages/Sign_Text_speech.dart';
import 'package:camera_application/Pages/video_text_signlanguage.dart';
import 'package:flutter/material.dart';

class SpeechTextSign extends StatefulWidget {
  const SpeechTextSign({super.key});

  @override
  State<SpeechTextSign> createState() => _SpeechTextSignState();
}



class _SpeechTextSignState extends State<SpeechTextSign> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String? _selectedOption1;
  String? _selectedOption2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColorLight,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 412.0,
                height: 743.5,
                color: Theme.of(context).colorScheme.background,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 30.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 2.0,
                          ),
                        ),
                        child: Icon(
                          Icons.mic,
                          color: Colors.black,
                          size: 50.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 20.0, bottom: 30.0),
                      child: Container(
                        width: 418.0,
                        height: 47.0,
                        color: Theme.of(context).colorScheme.background,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 20.0),
                      child: Container(
                        width: 413.0,
                        height: 21.0,
                        color: Theme.of(context).colorScheme.background,
                        child: const Padding(
                          padding: EdgeInsetsDirectional.only(start: 20.0),
                          child: Text(
                            'Text',
                            style: TextStyle(
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        child: Container(
                          width: 414.0,
                          height: 167.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: Container(
                        width: 416.0,
                        height: 26.0,
                        child: const Text(
                          'Sign Language',
                          style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        child: Container(
                          width: 398.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
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
              Container(
                width: 412,
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
