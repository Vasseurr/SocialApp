import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../view/main/controller/main_controller.dart';
import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);
  final MainController _controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: MyColors.primaryColorList)),
      ),
      title: Text(
        _controller.appBarTitle,
        style: GoogleFonts.lobster(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 17.sp,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
