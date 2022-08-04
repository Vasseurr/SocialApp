import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_app/core/init/navigation/navigation_route.dart';
import 'package:social_app/view/messages/controller/messages_controller.dart';
import 'package:social_app/view/messages/model/user.dart';
import 'package:social_app/view/messages/repository/messages_repository.dart';
import 'package:social_app/view/messages/sub/chat_room/ui/chat_room_page.dart';

import '../../../../../core/routes/app_routes.dart';

class CreateChatRoomController extends GetxController {
  late MessagesRepository _messagesRepository;

  final RxBool _isLoading = false.obs;
  final RxList<UserModel> userList = RxList();
  final RxList<UserModel> tempUserList = RxList();
  final RxList<UserModel> selectedUserList = RxList();
  //* for indicate user is selected or not
  final RxList<bool> selectedUserBoolList = RxList();

  final TextEditingController textEditingController = TextEditingController();

  set isLoading(value) => _isLoading.value;
  get isLoading => _isLoading.value;
  changeLoading() => _isLoading.value = !_isLoading.value;

  CreateChatRoomController() {
    _messagesRepository = Get.find<MessagesController>().messagesRepository;
  }

  @override
  void onInit() {
    userList.addAll([
      UserModel(userName: "Feyza", gender: 'female'),
      UserModel(userName: "Nur", gender: 'female'),
      UserModel(userName: "Beyza", gender: 'female'),
      UserModel(userName: "Furkan", gender: 'male'),
      UserModel(userName: "Eda", gender: 'female'),
      UserModel(userName: "Recep", gender: 'male'),
      UserModel(userName: "Hüseyin", gender: 'male'),
      UserModel(userName: "Kadir", gender: 'male'),
      UserModel(userName: "Eray", gender: 'male'),
      UserModel(userName: "Buse", gender: 'female'),
      UserModel(userName: "Okan", gender: 'male'),
      UserModel(userName: "Elif", gender: 'female'),
      UserModel(userName: "Melisa", gender: 'female'),
    ]);
    selectedUserBoolList.value =
        List.filled(userList.length, false, growable: false);
    tempUserList.value = userList.toList();
    super.onInit();
  }

  //*decide which operation will use
  void operate(UserModel user) {
    int index = userList.indexOf(user);
    if (selectedUserBoolList[index]) {
      unSelectUser(user);
      return;
    }
    addUser(user);
    return;
  }

  void addUser(UserModel user) {
    int index = userList.indexOf(user);
    selectedUserList.add(user);
    selectedUserBoolList[index] = true;
    textEditingController.clear();
    tempUserList.value = userList.toList();
  }

  void unSelectUser(UserModel user) {
    int index = userList.indexOf(user);
    selectedUserList.remove(user);
    selectedUserBoolList[index] = false;
  }

  bool getIsSelected(UserModel user) {
    return selectedUserBoolList[userList.indexOf(user)];
  }

  void createChatRoom() {
    final MessagesController controller = Get.find<MessagesController>();
    if (controller.userList
        .where(
            (p0) => p0.userName.contains(selectedUserList[0].userName) == true)
        .isEmpty) {
      controller.userList.add(selectedUserList[0]);
      //  controller.tempUserList.value = controller.userList.toList();
    }

    NavigationRoute.instance
        .off(() => ChatRoomPage(userModel: selectedUserList[0]));
  }
}
