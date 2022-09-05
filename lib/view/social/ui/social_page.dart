import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/core/extension/context_extension.dart';
import 'package:social_app/core/components/widgets/post_card.dart';

import '../../../core/components/widgets/custom_loading.dart';
import '../controller/social_controller.dart';

class SocialPage extends GetView<SocialController> {
  const SocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value == true
          ? const CustomLoading()
          : Container(
              margin: EdgeInsets.symmetric(vertical: context.lowHeightValue),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: controller.postList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return PostCard(photoUrls: controller.postList[index]);
                },
              ),
            ),
    );
  }
}
