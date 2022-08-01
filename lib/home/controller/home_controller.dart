import 'package:get/get.dart';
import '../../home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  final RxBool _isLoading = false.obs;

  HomeController(this._repository);

  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;

  changeLoading() => _isLoading.value = !_isLoading.value;

  @override
  void onReady() {
    super.onReady();
    changeLoading();
  }
}
