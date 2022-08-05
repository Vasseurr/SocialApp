import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';
import 'package:social_app/core/init/navigation/navigation_route.dart';
import 'package:social_app/core/init/network/manager/base/network_base_manager.dart';
import 'package:social_app/view/messages/controller/messages_controller.dart';
import 'package:social_app/view/messages/sub/create_chat_room/ui/create_chat_room_page.dart';

import '../../../view/main/controller/main_controller.dart';
import '../../../view/messages/ui/chat_rooms_page.dart';
import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({Key? key, this.title}) : super(key: key);
  final MainController _controller = Get.find<MainController>();
  String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: MyColors.primaryColorList),
        ),
      ),
      title: Text(
        title ?? _controller.appBarTitle,
        style: GoogleFonts.lobster(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 17.sp,
        ),
      ),
      centerTitle: true,
      //* Add chat room button
      actions: _controller.appBarTitle == LocaleKeys.pages_myMessages.tr() &&
              _controller.networkResult.value == NetworkResult.on
          ? [
              IconButton(
                onPressed: () =>
                    NavigationRoute.instance.to(() => CreateChatRoomPage())
                        //* for refresh list
                        .then(
                  (value) {
                    ChatRoomsPage().textEditingController.clear();
                    Get.find<MessagesController>().tempUserList.value =
                        Get.find<MessagesController>().userList.toList();
                  },
                ),
                icon: const Icon(
                  Icons.add_box_rounded,
                  size: AppConstants.midRadius,
                ),
              )
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
