import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../constants/colors.dart';

class CustomCacheProfileNetworkImage extends StatelessWidget {
  const CustomCacheProfileNetworkImage(
      {Key? key, required this.imageUrl, this.isProgressIndicator = false})
      : super(key: key);
  final String imageUrl;
  final bool isProgressIndicator;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: AppConstants.midRadius,
        backgroundImage: imageProvider,
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          isProgressIndicator == true
              ? CircularProgressIndicator(
                  strokeWidth: 3.0,
                  backgroundColor: MyColors.primaryColorList.last,
                  color: MyColors.primaryColorList.first,
                  value: downloadProgress.progress)
              : const SizedBox(),
      /* progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          backgroundColor: MyColors.primaryColorList.last,
                          color: MyColors.primaryColorList.first,
                          value: downloadProgress.progress),*/
      // placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
