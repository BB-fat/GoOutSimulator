import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static HiveHelper _instance;
  static HiveHelper get instance {
    if (_instance == null) {
      _instance = HiveHelper._init();
    }
    return _instance;
  }

  HiveHelper._init();

  Future initHive() async {
    await Hive.initFlutter();
    _defaultBox = await Hive.openBox("Default");
  }

  Box _defaultBox;

  Box get defaultBox => _defaultBox;
}
