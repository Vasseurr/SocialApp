import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:social_app/view/messages/controller/messages_controller.dart';
import 'package:social_app/view/messages/repository/messages_repository.dart';

class MessageDetailController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxList<String> messageList = RxList();
  late MessagesRepository _messagesRepository;

  final TextEditingController textEditingController = TextEditingController();
  final ItemScrollController itemScrollController = ItemScrollController();

  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;

  MessageDetailController() {
    _messagesRepository = Get.find<MessagesController>().messagesRepository;
  }

  changeLoading() => _isLoading.value = !_isLoading.value;

  @override
  void onInit() {
    super.onInit();
    messageList.add("Merhaba");
    messageList.add("Merhaba");
    messageList.add("Selam naber");
    messageList.add("İyidir senden naber");
    messageList.add("İyidir benden de");
    messageList.add("Nerede yaşıyorsun");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> deleteMessage(int index) async {
    changeLoading();
    messageList.removeAt(index);
    changeLoading();
  }
}
