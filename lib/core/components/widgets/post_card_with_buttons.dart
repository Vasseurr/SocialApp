import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/widgets/custom_cache_network_image.dart';
import 'package:social_app/view/messages/model/user.dart';

import '../../constants/app_constants.dart';
import '../../constants/padding_values.dart';
import 'custom_cache_profile_network_image.dart';

class PostCardWithButtons extends StatelessWidget {
  PostCardWithButtons({Key? key, required this.user}) : super(key: key);
  UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .67,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _postCardHeader(user),
          _postCardImage(context, user),
          _postCardButtons(context),
          _likeCount(),
          _userAndDesc(user)
        ],
      ),
    );
  }

  Padding _userAndDesc(UserModel user) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: CustomPaddingValues.smallV.sp,
          horizontal: CustomPaddingValues.mediumH.sp),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: "${user.userName}  ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Colors.black),
            children: [
              TextSpan(
                text: AppConstants.profileDescription,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: Colors.black),
              )
            ]),
      ),
    );
  }

  Padding _likeCount() {
    return Padding(
      padding: EdgeInsets.only(
          top: CustomPaddingValues.xSmallV,
          left: CustomPaddingValues.mediumH.sp,
          right: CustomPaddingValues.mediumH.sp),
      child: Text(
        "100 Likes",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13.sp, color: Colors.black),
      ),
    );
  }

  SizedBox _postCardButtons(BuildContext context) {
    return SizedBox(
      height: context.height * .05,
      child: Row(
        children: [
          _postIconButton(icon: Icons.favorite_border, onPressed: () {}),
          _postIconButton(icon: Icons.comment, onPressed: () {}),
          _postIconButton(icon: Icons.send, onPressed: () {}),
          const Spacer(),
          _postIconButton(
              icon: Icons.format_list_bulleted_rounded, onPressed: () {}),
        ],
      ),
    );
  }

  IconButton _postIconButton(
      {required IconData icon, required Function() onPressed}) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.black,
        ));
  }

  Padding _postCardImage(BuildContext context, UserModel user) {
    return Padding(
      padding: EdgeInsets.only(top: CustomPaddingValues.mediumV.sp),
      child: SizedBox(
        width: context.width,
        height: context.height * .4,
        child: CustomCacheNetworkImage(
          imageUrl: user.postsUrlList!.first.first,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Row _postCardHeader(UserModel user) {
    return Row(
      children: [
        CustomCacheProfileNetworkImage(
          imageUrl: user.profileImageUrl ?? AppConstants.avatarMaleURL,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
          child: Text(
            user.userName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
