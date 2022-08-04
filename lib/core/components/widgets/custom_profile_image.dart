import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/constants/app_constants.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({Key? key, required this.gender}) : super(key: key);
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: CircleAvatar(
        radius: AppConstants.midRadius,
        backgroundImage: NetworkImage(
          gender == "male"
              ? AppConstants.avatarMaleURL
              : AppConstants.avatarFemaleURL,
        ),
      ),
    );
  }
}
