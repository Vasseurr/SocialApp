import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/core/components/widgets/custom_appbar.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/constants/asset_URL.dart';
import 'package:social_app/core/constants/colors.dart';
import 'package:social_app/view/main/controller/main_controller.dart';

// ignore: must_be_immutable
class CustomScaffold extends StatefulWidget {
  CustomScaffold({Key? key, required this.body}) : super(key: key);
  Widget body;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final MainController _controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      resizeToAvoidBottomInset: false,
      body: widget.body,
      bottomNavigationBar: CustomNavigationBar(
        iconSize: AppConstants.iconSize,
        selectedColor: MyColors.selectedTabIndexColor,
        unSelectedColor: MyColors.unSelectedTabIndexColor,
        elevation: 0,
        currentIndex: _controller.currentBarIndex,
        strokeColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _controller.changeBarIndex(index);
          });
        },
        items: [
          CustomNavigationBarItem(
              icon: Icon(_controller.currentBarIndex == 0
                  ? Icons.home
                  : Icons.home_outlined)),
          CustomNavigationBarItem(icon: const Icon(CupertinoIcons.search)),
          CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.person_alt_circle)),
          CustomNavigationBarItem(
              icon: Image.asset(AssetURL.instance.MESSENGER,
                  color: Colors.white
                      .withOpacity(_controller.currentBarIndex == 3 ? 1 : 0.5),
                  colorBlendMode: BlendMode.modulate)),
        ],
      ),
    );
  }
}
