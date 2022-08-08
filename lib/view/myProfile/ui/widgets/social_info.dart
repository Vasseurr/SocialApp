import 'package:flutter/material.dart';
import 'package:social_app/core/extension/context_extension.dart';

import '../../../../core/constants/padding_values.dart';

class SocialInfo extends StatelessWidget {
  SocialInfo({
    Key? key,
    required this.value,
    required this.text,
  }) : super(key: key);

  String value;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: EdgeInsets.only(top: CustomPaddingValues.smallH),
          child: Text(
            text,
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
