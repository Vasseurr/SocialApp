import 'package:get/get.dart';
import 'package:social_app/view/messages/model/user.dart';
import 'package:social_app/view/messages/repository/messages_repository.dart';

class MessagesController extends GetxController {
  final MessagesRepository messagesRepository;
  final RxBool _isLoading = false.obs;
  RxList<UserModel> userList = RxList();
  RxList<UserModel> tempUserList = RxList();

  MessagesController(this.messagesRepository);

  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;

  changeLoading() => _isLoading.value = !_isLoading.value;

  @override
  void onInit() {
    _isLoading.value = true;
    userList.addAll([
      UserModel(userName: "Prest", gender: 'male'),
      UserModel(userName: "John", gender: 'male'),
      UserModel(userName: "Alexandra", gender: 'female'),
      UserModel(userName: "Alice", gender: 'female'),
      UserModel(userName: "Alfie", gender: 'male'),
      UserModel(userName: "Devon", gender: 'male'),
      UserModel(userName: "Audrey", gender: 'female'),
      UserModel(userName: "Freya", gender: 'female'),
      UserModel(userName: "Florence", gender: 'female'),
    ]);

    tempUserList.value = userList.toList();
    super.onInit();
  }

  @override
  void onReady() {
    _isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
