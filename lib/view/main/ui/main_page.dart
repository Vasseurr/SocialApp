import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/core/components/widgets/custom_scaffold.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';
import 'package:social_app/view/home/bindings/home_binding.dart';
import 'package:social_app/view/home/ui/home_page.dart';
import 'package:social_app/view/main/controller/main_controller.dart';
import 'package:social_app/view/messages/ui/messages_page.dart';
import 'package:social_app/view/profile/ui/profile_page.dart';
import 'package:social_app/view/social/ui/social_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
      initState: (state) {
        HomeBinding().dependencies();
      },
      builder: (controller) {
        return CustomScaffold(
            body: IndexedStack(
          index: controller.currentBarIndex,
          children: const [
            HomePage(),
            ProfilePage(),
            SocialPage(),
            MessagesPage()
          ],
        ));
      },
    );
  }
}
