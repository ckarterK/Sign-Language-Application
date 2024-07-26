import 'package:camera_application/Controllers/video_text_sign_language_logic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera_application/User_Interface/dropDownUI.dart';

class VideoTextSignLanguageWidget extends StatefulWidget {
  const VideoTextSignLanguageWidget({Key? key}) : super(key: key);

  @override
  State<VideoTextSignLanguageWidget> createState() =>
      _VideoTextSignLanguageWidgetState();
}

class _VideoTextSignLanguageWidgetState
    extends State<VideoTextSignLanguageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final VideoTextSignLanguageLogic _logic = VideoTextSignLanguageLogic();
  String? _videoPath;
  bool _isVideoUploaded = false;

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
                            onPressed: () async {
                              final videoPath = await _logic.handleUploadVideo();
                              if (videoPath != null) {
                                setState(() {
                                  _videoPath = videoPath;
                                  _isVideoUploaded = true;
                                });
                              }
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
                              _isVideoUploaded ? 'Video Uploaded' : 'Upload Video',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _logic.handleTranslate(_videoPath);
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
                              color: Colors.black,
                            ),
                          ),
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
      ),
    );
  }
}
