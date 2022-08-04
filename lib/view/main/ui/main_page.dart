import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/core/components/widgets/custom_scaffold.dart';

import 'package:social_app/view/home/ui/home_page.dart';
import 'package:social_app/view/main/controller/main_controller.dart';

import 'package:social_app/view/messages/ui/chat_rooms_page.dart';
import 'package:social_app/view/myProfile/ui/my_profile_page.dart';
import 'package:social_app/view/social/ui/social_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
      initState: (state) {},
      builder: (controller) {
        return CustomScaffold(
            body: IndexedStack(
          index: controller.currentBarIndex,
          children: [
            const HomePage(),
            const MyProfilePage(),
            const SocialPage(),
            ChatRoomsPage()
          ],
        ));
      },
    );
  }
}
