// ignore_for_file: prefer_const_constructors
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/widgets/custom_cache_profile_network_image.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/constants/padding_values.dart';
import 'package:social_app/core/extension/context_extension.dart';
import 'package:social_app/view/messages/model/user.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.mediumHeightValue),
        child: Column(
          children: [
            _featuredStories(context),
            Divider(thickness: AppConstants.lowThickness),
            _postList(context),
          ],
        ),
      ),
    );
  }

  Widget _postList(BuildContext context) {
    return controller.userList.first.postsUrlList != null
        ? ListView.builder(
            itemCount: controller.userList.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: CustomPaddingValues.smallV.sp),
                child: _postCard(context, controller.userList[index]),
              );
            },
          )
        : SizedBox();
  }

  SizedBox _postCard(BuildContext context, UserModel user) {
    return SizedBox(
      height: context.height * .66,
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
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          Spacer(),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.format_list_bulleted_rounded)),
        ],
      ),
    );
  }

  Padding _postCardImage(BuildContext context, UserModel user) {
    return Padding(
      padding: EdgeInsets.only(top: CustomPaddingValues.mediumV.sp),
      child: SizedBox(
        width: context.width,
        height: context.height * .4,
        child: Image.network(
          user.postsUrlList!.first.first,
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
        Spacer(),
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

  SizedBox _featuredStories(BuildContext context) {
    return SizedBox(
      height: context.getHeight * 0.15,
      child: ListView.builder(
        itemCount: controller.userList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5.sp),
            child: Column(
              children: [
                CustomCacheProfileNetworkImage(
                  imageUrl:
                      controller.userList[index].storiesUrlList!.first.first,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: CustomPaddingValues.mediumH),
                  child: Text(controller.userList[index].userName),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
