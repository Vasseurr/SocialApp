import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColumnWithSpacing extends StatelessWidget {
  ColumnWithSpacing(
      {Key? key,
      required this.children,
      required this.space,
      this.crossAxisAlignment,
      this.mainAxisAlignment})
      : super(key: key);
  CrossAxisAlignment? crossAxisAlignment;
  MainAxisAlignment? mainAxisAlignment;
  double space;
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: children
          .map((child) => Padding(
                padding: EdgeInsets.only(top: space),
                child: child,
              ))
          .toList(),
    );
  }
}
