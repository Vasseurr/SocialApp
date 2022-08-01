// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:social_app/core/extension/context_extension.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.mediumHeightValue),
      child: Column(
        children: const [],
      ),
    );
  }
}
