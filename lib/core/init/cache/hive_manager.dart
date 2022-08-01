import '../../constants/hive_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._init();

  static late Box<dynamic> _db;

  static HiveManager get instance => _instance;

  HiveManager._init() {
    openBox();
  }
  static preferencesInit() async {
    // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    // Hive.init(directory.path);
    await Hive.initFlutter();
    //  HiveManager._init();
    await openBox();
    return;
  }

  static Future<void> openBox() async {
    _db = await Hive.openBox('user');
  }

  Future<void> setStringValue(HiveKeys key, String value) async {
    await _db.put(key.toString(), value);
  }

  String? getStringValue(HiveKeys key) => _db.get(key.toString());

  Future<void> setIntValue(HiveKeys key, int value) async {
    await _db.put(key.toString(), value);
  }

  int? getIntValue(HiveKeys key) => _db.get(key.toString());

  Future<void> setBoolValue(HiveKeys key, bool value) async {
    await _db.put(key.toString(), value);
  }

  bool? getBoolValue(HiveKeys key) => _db.get(key.toString());

  Future<void> setGenericValue<T>(HiveKeys key, T value) async {
    await _db.put(key.toString(), value);
  }

  T? getGenericValue<T>(HiveKeys key) => _db.get(key.toString());

  void clear() {
    _db.clear();
  }
}
