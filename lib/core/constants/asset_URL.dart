// ignore_for_file: non_constant_identifier_names

class AssetURL {
  static final AssetURL _instance = AssetURL._init();
  static AssetURL get instance => _instance;

  AssetURL._init();

  String get LOGO_ALTERNATIVE => pathImageValue("logo");
  String get CALENDAR => pathIconValue("calendar");
  String get MESSENGER => pathImageValue("messenger");

  String pathIconValue(String name) => 'assets/icons/$name.png';
  String pathImageValue(String name) => 'assets/images/$name.png';
}
