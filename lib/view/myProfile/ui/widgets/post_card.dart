import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostCard extends StatelessWidget {
  PostCard({Key? key, required this.photoUrls}) : super(key: key);
  List<String> photoUrls;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(photoUrls.first),
          photoUrls.length > 1
              ? const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.content_copy_rounded,
                        color: Colors.white,
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
