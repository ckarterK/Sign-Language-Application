import 'package:flutter/foundation.dart';

class DropdownManager {
  static final DropdownManager _instance = DropdownManager._internal();

  factory DropdownManager() {
    return _instance;
  }

  DropdownManager._internal();

  final ValueNotifier<String?> masterDropdownNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<String?> slaveDropdownNotifier = ValueNotifier<String?>(null);

  void updateDropdowns(String? newMasterValue) {
    masterDropdownNotifier.value = newMasterValue;
    if (newMasterValue == 'Video') {
      slaveDropdownNotifier.value = 'Text & Sign';
    } else if (newMasterValue == 'Sign Language') {
      slaveDropdownNotifier.value = 'Text & Speech';
    } else if (newMasterValue == 'Speech') {
      slaveDropdownNotifier.value = 'Text & Sign';
    }
  }
}
