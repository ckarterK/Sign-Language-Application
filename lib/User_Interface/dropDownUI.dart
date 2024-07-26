import 'package:camera_application/Controllers/DropDown_logic.dart';
import 'package:flutter/material.dart';
import 'Sign_Text_speech.dart';
import 'speech_text_sign.dart';
import 'video_text_signlanguage.dart';

class DropDownContainer extends StatefulWidget {
  const DropDownContainer({super.key});

  @override
  _DropDownContainerState createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  final DropdownManager _dropdownManager = DropdownManager();

  @override
  void initState() {
    super.initState();
    _dropdownManager.masterDropdownNotifier.addListener(_updateSlaveDropdown);
    _dropdownManager.slaveDropdownNotifier.addListener(_updateMasterDropdown);
  }

  @override
  void dispose() {
    _dropdownManager.masterDropdownNotifier.removeListener(_updateSlaveDropdown);
    _dropdownManager.slaveDropdownNotifier.removeListener(_updateMasterDropdown);
    super.dispose();
  }

  void _updateSlaveDropdown() {
    final masterValue = _dropdownManager.masterDropdownNotifier.value;
    if (masterValue == 'Video') {
      _dropdownManager.slaveDropdownNotifier.value = 'Text & Sign';
    } else if (masterValue == 'Sign Language') {
      _dropdownManager.slaveDropdownNotifier.value = 'Text & Speech';
    } else if (masterValue == 'Speech') {
      _dropdownManager.slaveDropdownNotifier.value = 'Text & Sign';
    }
  }

  void _updateMasterDropdown() {
    final slaveValue = _dropdownManager.slaveDropdownNotifier.value;
    if (slaveValue == 'Text & Sign') {
      _dropdownManager.masterDropdownNotifier.value = 'Video';
    } else if (slaveValue == 'Text & Speech') {
      _dropdownManager.masterDropdownNotifier.value = 'Sign Language';
    } else if (slaveValue == 'Text & Sign') {
      _dropdownManager.masterDropdownNotifier.value = 'Speech';
    }
  }

  void _navigateToScreen(String? newValue) {
    if (newValue == 'Video') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VideoTextSignLanguageWidget()),
      );
    } else if (newValue == 'Sign Language') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignLanguageTranslatorScreen()),
      );
    } else if (newValue == 'Speech') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  SpeechToTextScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: ValueListenableBuilder<String?>(
                valueListenable: _dropdownManager.masterDropdownNotifier,
                builder: (context, masterValue, _) {
                  return DropdownButton<String>(
                    hint: Text('From'),
                    value: masterValue,
                    onChanged: (String? newValue) {
                      _dropdownManager.updateDropdowns(newValue);
                      _navigateToScreen(newValue);
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
                  );
                },
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
            child: ValueListenableBuilder<String?>(
              valueListenable: _dropdownManager.slaveDropdownNotifier,
              builder: (context, slaveValue, _) {
                return DropdownButton<String>(
                  hint: Text('To'),
                  value: slaveValue,
                  onChanged: (String? newValue) {
                    _dropdownManager.slaveDropdownNotifier.value = newValue;
                  },
                  items: _getSlaveDropdownItems(),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _getSlaveDropdownItems() {
    List<String> items = [];

    final masterValue = _dropdownManager.masterDropdownNotifier.value;

    if (masterValue == 'Video') {
      items = ['Text & Sign'];
    } else if (masterValue == 'Sign Language') {
      items = ['Text & Speech'];
    } else if (masterValue == 'Speech') {
      items = ['Text & Sign'];
    }

    return items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
