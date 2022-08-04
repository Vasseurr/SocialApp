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
      UserModel(userName: "Okan", gender: 'male'),
      UserModel(userName: "Eda", gender: 'female'),
      UserModel(userName: "Nevin", gender: 'female'),
      UserModel(userName: "Ayşe", gender: 'female'),
      UserModel(userName: "Furkan", gender: 'male'),
      UserModel(userName: "Hüseyin", gender: 'male'),
      UserModel(userName: "Melisa", gender: 'female'),
      UserModel(userName: "Buse", gender: 'female'),
      UserModel(userName: "Büşra", gender: 'female'),
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
    // TODO: implement onClose
    super.onClose();
  }
}
