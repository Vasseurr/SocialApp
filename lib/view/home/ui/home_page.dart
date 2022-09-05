// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/widgets/custom_cache_profile_network_image.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/constants/padding_values.dart';
import 'package:social_app/core/extension/context_extension.dart';
import '../../../core/components/widgets/post_card_with_buttons.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.lowHeightValue),
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
                child: PostCardWithButtons(user: controller.userList[index]),
              );
            },
          )
        : SizedBox();
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
