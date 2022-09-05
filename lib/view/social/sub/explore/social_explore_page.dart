import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/widgets/custom_cache_network_image.dart';
import 'package:social_app/core/components/widgets/custom_loading.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';
import 'package:social_app/view/social/sub/explore/controller/social_explore_controller.dart';

import '../../../../core/components/widgets/post_card_with_buttons.dart';
import '../../../../core/constants/padding_values.dart';

// ignore: must_be_immutable
class SocialExplorePage extends StatelessWidget {
  SocialExplorePage({Key? key, required this.firstImageUrls}) : super(key: key);
  List<String> firstImageUrls;

  final SocialExploreController controller = Get.put(SocialExploreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(LocaleKeys.pages_explore.tr()),
        toolbarHeight: context.height * .06,
      ),
      body: Obx(
        () => controller.isLoading.value == true
            ? const CustomLoading()
            : ListView.builder(
                itemCount: controller.userList.length + 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    //Todo: change with user model like as below
                    return SizedBox(
                      child: CustomCacheNetworkImage(
                        imageUrl: firstImageUrls.first,
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: CustomPaddingValues.smallV.sp),
                    child:
                        PostCardWithButtons(user: controller.userList[index]),
                  );
                },
              ),
      ),
    );
  }
}
