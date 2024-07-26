import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera_application/Controllers/speech_to_text_logic.dart';
import 'package:camera_application/User_Interface/dropDownUI.dart';

class SpeechToTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SpeechToTextLogic(),
      child: Consumer<SpeechToTextLogic>(
        builder: (context, logic, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SafeArea(
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
                                color: logic.iconContainerColor,
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  width: 2.0,
                                ),
                              ),
                              child: Icon(
                                Icons.mic,
                                color: logic.iconColor,
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
                                child: Text(
                                  logic.recognizedText,
                                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
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
                              onPressed: logic.isCountingDown ? null : () {
                                logic.startCountdown(() {
                                  logic.startListening(() {
                                    // Handle result here
                                  }, () {
                                    // Handle completion here
                                  });
                                });
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
                              child: Text(
                                logic.buttonText,
                                style: const TextStyle(
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
                    DropDownContainer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
