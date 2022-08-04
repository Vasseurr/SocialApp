import 'package:get/get.dart';
import 'package:social_app/view/home/bindings/home_binding.dart';
import 'package:social_app/view/home/ui/home_page.dart';
import 'package:social_app/view/main/bindings/main_binding.dart';
import 'package:social_app/view/messages/bindings/messages_binding.dart';
import 'package:social_app/view/messages/sub/chat_room/ui/chat_room_page.dart';
import 'package:social_app/view/messages/ui/chat_rooms_page.dart';
import '../../core/routes/app_routes.dart';
import '../../view/main/ui/main_page.dart';
import '../../view/messages/sub/create_chat_room/ui/create_chat_room_page.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const MainPage(),
        binding: MainBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    /*   GetPage(
      name: Routes.SOCIAL,
      page: () => const SocialPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const MyProfilePage(),
      binding: MainBinding(),
    ),*/
    GetPage(
        name: Routes.CHATROOMS,
        page: () => ChatRoomsPage(),
        binding: MessagesBinding()),
    GetPage(
        name: Routes.CHATROOM,
        page: () => ChatRoomPage(userModel: Get.arguments),
        binding: MessagesBinding()),
    GetPage(
        name: Routes.ADDCHATROOM,
        page: () => CreateChatRoomPage(),
        binding: MessagesBinding()),
  ];
}
