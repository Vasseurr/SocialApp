import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
      ),
    );
  }
}
