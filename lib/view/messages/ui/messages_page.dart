import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/text/vasseurr_text_form_field.dart';
import 'package:social_app/core/components/widgets/custom_loading.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';
import 'package:social_app/core/init/navigation/navigation_route.dart';
import 'package:social_app/view/messages/controller/messages_controller.dart';
import 'package:social_app/view/messages/model/user.dart';
import 'package:social_app/view/messages/sub/message_detail/message_detail_page.dart';

import '../../../core/components/widgets/custom_profile_image.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  final MessagesController _controller = Get.find<MessagesController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.isLoading
          ? const CustomLoading()
          : Column(
              children: [
                _search(),
                _list(),
              ],
            ),
    );
  }

  Padding _search() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: VasseurrTFF(
        textEditingController: _textEditingController,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        borderColor: Colors.grey,
        onChanged: (value) =>
            filterSearchResults(controller: _controller, searchingText: value),
        maxLines: 1,
        hintText: LocaleKeys.feature_searchUser.tr(),
      ),
    );
  }

  Expanded _list() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _controller.tempUserList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () => NavigationRoute.instance.to(() => MessageDetailPage(
                  userModel: _controller.tempUserList[index],
                )),
            child: ListTile(
              leading: CustomProfileImage(
                  gender: _controller.tempUserList[index].gender),
              title: Text(
                _controller.tempUserList[index].userName,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "Hello",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }

  filterSearchResults(
      {required MessagesController controller, required String searchingText}) {
    //controller.isSearching.value = true;
    List<UserModel> tempSearchList = [];
    tempSearchList.addAll(controller.tempUserList);
    if (searchingText.isNotEmpty) {
      List<UserModel> dummyListData = [];
      for (var item in tempSearchList) {
        if (item.userName.toLowerCase().contains(searchingText.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      controller.tempUserList.clear();
      controller.tempUserList.addAll(dummyListData);
      return;
    } else {
      controller.tempUserList.clear();
      controller.tempUserList.addAll(controller.userList);
      //   controller.isSearching.value = false;
    }
  }
}
