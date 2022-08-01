import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt _currentBarIndex = 0.obs;

  set currentBarIndex(value) => _currentBarIndex.value = value;
  get currentBarIndex => _currentBarIndex.value;

  void changeBarIndex(int index) {
    _currentBarIndex.value = index;
  }
}
