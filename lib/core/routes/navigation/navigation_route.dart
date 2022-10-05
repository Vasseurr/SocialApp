import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';

class NavigationRoute {
  //Todo: add a toWithMustLogin function and check the user login or not, if not show snackbar, otherwise navigate the page

  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Future<T?> to<T>(dynamic page,
      {dynamic arguments, Transition? transition}) async {
    //*close keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    return await Get.to<T>(page,
        arguments: arguments,
        transition: transition ?? Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: AppConstants.lowDuration));
  }

  Future<T?> off<T>(dynamic page,
      {dynamic arguments, Transition? transition}) async {
    //*close keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    return await Get.off<T>(page,
        arguments: arguments,
        transition: transition ?? Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: AppConstants.lowDuration));
  }

  Future<T?> toNamed<T>(String name, {dynamic arguments}) async {
    //*close keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    return await Get.toNamed<T>(name, arguments: arguments);
  }
}
