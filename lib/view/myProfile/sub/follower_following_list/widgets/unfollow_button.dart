import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';

import '../../../../../core/components/widgets/custom_profile_image.dart';
import '../../../../../core/constants/padding_values.dart';
import '../controller/follower_following_list_controller.dart';

// ignore: must_be_immutable
class UnFollowButton extends StatelessWidget {
  UnFollowButton({Key? key, required this.index}) : super(key: key);
  int index;

  final FollowerFollowListController _controller =
      Get.find<FollowerFollowListController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => unFollow(context),
      child: Container(
        width: context.width * 0.3,
        height: context.height * 0.05,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(width: 0.5, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(LocaleKeys.profile_unfollow.tr())),
      ),
    );
  }

  void unFollow(BuildContext context) {
    Get.defaultDialog(
      barrierDismissible: false,
      titleStyle: const TextStyle(color: Colors.white),
      titlePadding: EdgeInsets.symmetric(
          horizontal: CustomPaddingValues.xxSmallV,
          vertical: CustomPaddingValues.xxSmallV),
      contentPadding: EdgeInsets.symmetric(
          horizontal: CustomPaddingValues.mediumH,
          vertical: CustomPaddingValues.mediumV),
      content: Column(
        children: [
          CustomProfileImage(
            gender: _controller.tempFollowingUserModels[index].gender,
          ),
          SizedBox(height: CustomPaddingValues.mediumH),
          Text(
            "@${_controller.tempFollowingUserModels[index].userName}",
            style: GoogleFonts.archivo(fontSize: 12.sp, color: Colors.grey),
          ),
          SizedBox(height: CustomPaddingValues.largeH),
          Text(
            LocaleKeys.profile_unfollowQuestion.tr(),
            style: TextStyle(fontSize: 10.sp),
          ),
          SizedBox(height: CustomPaddingValues.largeH),
          const Divider(),
          TextButton(
            onPressed: () => _controller.removeFromFollowing(index),
            style: TextButton.styleFrom(
                primary: const Color.fromARGB(255, 23, 165, 236),
                fixedSize: Size.fromWidth(context.width),
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
            child: Text(LocaleKeys.profile_unfollow.tr()),
          ),
          const Divider(),
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              primary: Colors.black,
              fixedSize: Size.fromWidth(context.width),
            ),
            child: Text(LocaleKeys.profile_cancel.tr(),
                style: TextStyle(color: Colors.black, fontSize: 12.sp)),
          ),
        ],
      ),
    );
  }
}
