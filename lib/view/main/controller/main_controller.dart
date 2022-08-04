import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:social_app/core/init/lang/locale_keys.g.dart';

class MainController extends GetxController {
  final RxInt _currentBarIndex = 0.obs;
  final RxString _appBarTitle = LocaleKeys.pages_homepage.tr().obs;

  set currentBarIndex(value) => _currentBarIndex.value = value;
  get currentBarIndex => _currentBarIndex.value;

  set appBarTitle(value) => _appBarTitle.value = value;
  get appBarTitle => _appBarTitle.value;

  void changeBarIndex(int index) {
    _currentBarIndex.value = index;
    switch (index) {
      case 0:
        _appBarTitle.value = LocaleKeys.pages_homepage.tr();
        break;
      case 1:
        _appBarTitle.value = LocaleKeys.pages_social.tr();
        break;
      case 2:
        _appBarTitle.value = LocaleKeys.pages_profile.tr();
        break;
      case 3:
        _appBarTitle.value = LocaleKeys.pages_myMessages.tr();
        break;
    }
  }
}
