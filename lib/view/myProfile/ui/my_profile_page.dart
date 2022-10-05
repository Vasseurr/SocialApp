import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/buttons/vasseurr_button.dart';
import 'package:social_app/core/components/widgets/column_with_spacing.dart';
import 'package:social_app/core/components/widgets/custom_loading.dart';
import 'package:social_app/core/components/widgets/custom_profile_image.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/constants/padding_values.dart';
import 'package:social_app/core/extension/context_extension.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';
import 'package:social_app/view/myProfile/controller/my_profile_controller.dart';
import 'package:social_app/view/myProfile/sub/follower_following_list/follower_follow_list_page.dart';
import 'package:social_app/core/components/widgets/post_card.dart';
import 'package:social_app/view/myProfile/ui/widgets/social_info.dart';

import '../../../core/routes/navigation/navigation_route.dart';

class MyProfilePage extends StatelessWidget {
  MyProfilePage({Key? key}) : super(key: key);

  final MyProfileController _controller = Get.find<MyProfileController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CustomPaddingValues.mediumH),
      child: SingleChildScrollView(
        child: Obx(
          () => _controller.isLoading.value == true
              ? const CustomLoading()
              : ColumnWithSpacing(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  space: CustomPaddingValues.largeV,
                  children: [
                    _ppWithSocialInfo(context),
                    _fullNameWithDesc(context),
                    _editProfileButton(context),
                    _controller.storiesImage.isEmpty
                        ? const SizedBox()
                        : _featuredStories(context),
                    _controller.postImages.isEmpty
                        ? const SizedBox()
                        : _posts(),
                  ],
                ),
        ),
      ),
    );
  }

  GridView _posts() {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: _controller.postImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return PostCard(photoUrls: _controller.postImages[index]);
      },
    );
  }

  SizedBox _featuredStories(BuildContext context) {
    return SizedBox(
      height: context.getHeight * 0.1,
      child: ListView.builder(
        itemCount: _controller.storiesImage.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5.sp),
            child: CircleAvatar(
              radius: AppConstants.midRadius,
              backgroundImage: NetworkImage(_controller.storiesImage[index]),
            ),
          );
        },
      ),
    );
  }

  VasseurrBttn _editProfileButton(BuildContext context) {
    return VasseurrBttn(
        buttonHeight: context.getHeight * 0.05,
        buttonWidth: context.getWidth,
        borderRadius: 5,
        buttonColor: Colors.white,
        borderColor: Colors.black12,
        textColor: Colors.black,
        buttonText: "Edit Profile",
        textStyle:
            context.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
        onpressed: () {});
  }

  ColumnWithSpacing _fullNameWithDesc(BuildContext context) {
    return ColumnWithSpacing(
      space: CustomPaddingValues.smallV,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.fullName,
          style: context.textTheme.headline6!,
        ),
        AutoSizeText(
          AppConstants.profileDescription,
          style: context.textTheme.titleSmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  SizedBox _ppWithSocialInfo(BuildContext context) {
    return SizedBox(
      height: context.getHeight * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomProfileImage(gender: 'male'),
          SocialInfo(
              value: _controller.userProfile.value.postNumber,
              text: LocaleKeys.profile_posts.tr()),
          InkWell(
            onTap: () => NavigationRoute.instance.to(
              () => FollowerFollowingListPage(selectedPageIndex: 0),
            ),
            child: SocialInfo(
                value: _controller.userProfile.value.followerNumber,
                text: LocaleKeys.profile_follower.tr()),
          ),
          InkWell(
            onTap: () => NavigationRoute.instance.to(
              () => FollowerFollowingListPage(selectedPageIndex: 1),
            ),
            child: SocialInfo(
                value: _controller.userProfile.value.followingNumber,
                text: LocaleKeys.profile_following.tr()),
          ),
        ],
      ),
    );
  }
}
