import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.isProgressIndicator = false,
      this.fit})
      : super(key: key);
  final String imageUrl;
  final bool isProgressIndicator;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider, fit: fit ?? BoxFit.fill)),
          )),
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
