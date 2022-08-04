import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/text/vasseurr_text_form_field.dart';
import 'package:social_app/core/components/widgets/custom_loading.dart';
import 'package:social_app/core/components/widgets/custom_profile_image.dart';
import 'package:social_app/core/constants/colors.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';
import 'package:social_app/view/messages/model/user.dart';
import 'package:social_app/view/messages/sub/message_detail/controller/message_detail_controller.dart';

class MessageDetailPage extends StatelessWidget {
  MessageDetailPage({Key? key, required this.userModel}) : super(key: key);

  final MessageDetailController _controller =
      Get.put(MessageDetailController());

  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() => _controller.isLoading
          ? const CustomLoading()
          : Column(
              children: [
                _list(),
                _sendMessage(),
              ],
            )),
    );
  }

  Padding _sendMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: VasseurrTFF(
        textEditingController: _controller.textEditingController,
        radius: 50,
        hintTextColor: Colors.grey.shade800,
        hintText: LocaleKeys.feature_writeMessage.tr(),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.send,
            color: Colors.black,
          ),
          onPressed: (() => {
                if (_controller.textEditingController.text.isNotEmpty)
                  {
                    _controller.messageList
                        .add(_controller.textEditingController.text),
                    _controller.itemScrollController.scrollTo(
                        index: _controller.messageList.length - 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubic),
                    _controller.textEditingController.text = ""
                  }
              }),
        ),
      ),
    );
  }

  Expanded _list() {
    return Expanded(
        child: ScrollablePositionedList.builder(
      itemCount: _controller.messageList.length,
      itemBuilder: (context, index) => _message(context, index),
      itemScrollController: _controller.itemScrollController,
    ));
  }

  GestureDetector _message(BuildContext context, int index) {
    return GestureDetector(
      //TODO: will delete message
      onLongPress: () async => await _controller.deleteMessage(index),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment:
                  index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: context.width * 0.7),
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      width: 1.0,
                      color: index % 2 == 0 ? Colors.green : Colors.grey),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  _controller.messageList[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
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
      title: Row(
        children: [
          SizedBox(
            height: 6.h,
            child: CustomProfileImage(gender: userModel.gender),
          ),
          Text(
            userModel.userName,
            style: GoogleFonts.lobster(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 17.sp),
          ),
        ],
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    );
  }
}
