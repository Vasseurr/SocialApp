import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/constants/colors.dart';

import 'controller/follower_following_list_controller.dart';
import 'followers_page.dart';
import 'following_page.dart';

// ignore: must_be_immutable
class FollowerFollowingListPage extends StatefulWidget {
  FollowerFollowingListPage({
    Key? key,
    required this.selectedPageIndex,
  }) : super(key: key);

  //* indicate initial page follower or following
  int selectedPageIndex;

  @override
  State<FollowerFollowingListPage> createState() =>
      _FollowerFollowingListPageState();
}

class _FollowerFollowingListPageState extends State<FollowerFollowingListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FollowerFollowListController _followerFollowListController =
      Get.put(FollowerFollowListController());

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = widget.selectedPageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _appbar(),
        body: TabBarView(controller: _tabController, children: [
          FollowersPage(),
          FollowingPage(),
        ]),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text(
        "@${AppConstants.userName}",
        style: TextStyle(fontSize: 14.sp, color: Colors.white),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: MyColors.primaryColorList),
        ),
      ),
      bottom: TabBar(
        controller: _tabController,
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        indicatorColor: Colors.white,
        indicatorWeight: 3.0,
        tabs: const [
          Tab(
            text: "Takipçilerim",
          ),
          Tab(
            text: "Takip Ettiklerim",
          ),
        ],
      ),
    );
  }
}
