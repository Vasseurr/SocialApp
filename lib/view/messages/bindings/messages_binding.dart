import 'package:get/get.dart';
import 'package:social_app/view/messages/controller/messages_controller.dart';
import 'package:social_app/view/messages/repository/messages_repository.dart';
import 'package:social_app/view/messages/service/messages_service.dart';

class MessagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(
        () => MessagesController(MessagesRepository(MessagesService())));
  }
}
