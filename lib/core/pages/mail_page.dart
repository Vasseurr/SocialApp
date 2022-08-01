// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../core/components/buttons/custom_button.dart';
import '../../core/components/text/custom_text_form_field.dart';
import '../../core/extension/context_extension.dart';

class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(
            top: context.getHeight * 0.1,
            left: context.getWidth * 0.05,
            right: context.getWidth * 0.05),
        height: context.getHeight * 0.9,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTFF(
                    textInputAction: TextInputAction.next,
                    hintText: "E-mail",
                    hintColor: Colors.grey,
                    borderColor: Colors.grey,
                    fillColor: Colors.white,
                    maxLength: 50,
                  ),
                  SizedBox(height: context.getHeight * 0.03),
                  CustomTFF(
                    textInputAction: TextInputAction.next,
                    hintText: "Title",
                    hintColor: Colors.grey,
                    borderColor: Colors.grey,
                    fillColor: Colors.white,
                    maxLength: 50,
                  ),
                  SizedBox(height: context.getHeight * 0.03),
                  CustomTFF(
                    textInputAction: TextInputAction.done,
                    hintText: "Description",
                    hintColor: Colors.grey,
                    borderColor: Colors.grey,
                    fillColor: Colors.white,
                    maxLines: 8,
                    maxLength: 250,
                  ),
                  SizedBox(height: context.getHeight * 0.03),
                  CustomBttn(
                      width: context.getWidth * 0.9,
                      height: context.getHeight * 0.06,
                      buttonText: "Submit",
                      buttonColor: Colors.blue,
                      borderColor: Colors.blue,
                      onPressed: () {
                        print("SUBMITTED");
                      }),
                  Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
