import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/social/sub/explore/social_explore_page.dart';
import '../../routes/navigation/navigation_route.dart';
import 'custom_cache_network_image.dart';

// ignore: must_be_immutable
class PostCard extends StatefulWidget {
  PostCard({Key? key, required this.photoUrls}) : super(key: key);
  List<String> photoUrls;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isShowPreview = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          GestureDetector(
              //todo: navigate this page only from the social page, in profile user will see own posts
              onTap: () => NavigationRoute.instance.to(
                  () => SocialExplorePage(firstImageUrls: widget.photoUrls),
                  transition: Transition.native),
              onLongPress: () {
                //* zoom in
                setState(() {
                  _isShowPreview = true;
                });
              },
              onLongPressEnd: (details) {
                //* zoom out
                setState(() {
                  _isShowPreview = false;
                });
              },
              child: CustomCacheNetworkImage(imageUrl: widget.photoUrls.first)),
          //Image.network(photoUrls.first),
          widget.photoUrls.length > 1
              ? const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.content_copy_rounded,
                        color: Colors.white,
                      )),
                )
              : const SizedBox(),
          if (_isShowPreview) ...[
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CustomCacheNetworkImage(
                      imageUrl: widget.photoUrls.first)),
            ),
          ]
        ],
      ),
    );
  }
}
