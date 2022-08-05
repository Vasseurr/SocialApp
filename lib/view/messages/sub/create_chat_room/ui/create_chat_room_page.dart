import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/extension/context_extension.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';

import '../../../../../core/components/widgets/custom_loading.dart';
import '../../../../../core/components/widgets/custom_profile_image.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/padding_values.dart';
import '../../../model/user.dart';
import '../controller/create_chat_room_controller.dart';

class CreateChatRoomPage extends StatelessWidget {
  CreateChatRoomPage({Key? key}) : super(key: key);

  final CreateChatRoomController _controller =
      Get.put(CreateChatRoomController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: _appBar(),
          body: _controller.isLoading ? const CustomLoading() : _body(context),
        ));
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: CustomPaddingValues.mediumV),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(CustomPaddingValues.mediumV),
            child: Text(LocaleKeys.newMessage_to.tr()),
          ),
          _selectedUserList(context),
          Padding(
            padding: EdgeInsets.all(CustomPaddingValues.mediumV),
            child: Text(LocaleKeys.newMessage_suggested.tr()),
          ),
          _list(),
        ],
      ),
    );
  }

  Container _selectedUserList(BuildContext context) {
    return Container(
      width: context.getWidth,
      height: context.getHeight * 0.07,
      margin: EdgeInsets.symmetric(horizontal: CustomPaddingValues.mediumV),
      child: _controller.selectedUserList.isNotEmpty
          ? ListView.builder(
              itemCount: _controller.selectedUserList.length + 1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return index == _controller.selectedUserList.length
                    ? _searchTFF(context)
                    : _selectedUserCard(index);
              },
            )
          : _searchTFF(context),
    );
  }

  Padding _selectedUserCard(int index) {
    return Padding(
      padding: EdgeInsets.only(right: CustomPaddingValues.xSmallV),
      child: InkWell(
        onTap: () =>
            _controller.unSelectUser(_controller.selectedUserList[index]),
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.all(CustomPaddingValues.mediumV),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.midRadius),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: MyColors.primaryColorList)),
              child: Text(
                _controller.selectedUserList[index].userName,
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _searchTFF(BuildContext context) {
    return SizedBox(
      width: context.getWidth,
      child: TextFormField(
        controller: _controller.textEditingController,
        decoration: InputDecoration(
          hintText: LocaleKeys.feature_searchUser.tr(),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onChanged: (value) =>
            filterSearchResults(controller: _controller, searchingText: value),
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
          child: ListTile(
            //* decide which operation will be used select/unselect
            onTap: () => _controller.operate(_controller.tempUserList[index]),
            leading: CustomProfileImage(
                gender: _controller.tempUserList[index].gender),
            title: Text(
              _controller.tempUserList[index].userName,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              //TODO: change with last message
              "Hello",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
            ),
            trailing: Container(
              height: context.getHeight * 0.03.sp,
              width: context.getWidth * 0.1.sp,
              decoration: BoxDecoration(
                gradient: _controller
                            .getIsSelected(_controller.tempUserList[index]) ==
                        true
                    ? const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: MyColors.primaryColorList)
                    : null,
                border: Border.all(color: Colors.purple.shade800),
                shape: BoxShape.circle,
              ),
              child: const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: MyColors.primaryColorList),
        ),
      ),
      toolbarHeight: 6.h,
      title: Text(
        LocaleKeys.pages_newMessage.tr(),
        style: GoogleFonts.lobster(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 17.sp),
      ),
      centerTitle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      actions: [
        TextButton(
            style: TextButton.styleFrom(
                primary: _controller.selectedUserList.isEmpty
                    ? Colors.grey
                    : Colors.white),
            onPressed: _controller.selectedUserList.isEmpty
                ? null
                : () => _controller.createChatRoom(),
            child: Text(
              LocaleKeys.button_chat.tr(),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ))
      ],
    );
  }

  filterSearchResults(
      {required CreateChatRoomController controller,
      required String searchingText}) {
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
