import 'package:flutter/material.dart';
import '../../../core/components/buttons/vasseurr_button.dart';
import '../../../core/components/text/vasseurr_text_form_field.dart';
import '../../../core/extension/context_extension.dart';

class RegisterPage2 extends StatelessWidget {
  RegisterPage2({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _background(context),
            _form(context),
            _icon(context),
          ],
        ));
  }

  Container _icon(BuildContext context) {
    return Container(
      height: context.getHeight * 0.1,
      width: context.getWidth * 0.2,
      margin: EdgeInsets.symmetric(
          vertical: context.getHeight * 0.15,
          horizontal: context.getWidth * 0.4),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1)],
          borderRadius: BorderRadius.circular(30)),
      child: Icon(Icons.person, color: Colors.redAccent.shade400, size: 40),
    );
  }

  Form _form(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
        height: context.getHeight * 0.58,
        width: context.getWidth * 0.8,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWidth * 0.1,
            vertical: context.getHeight * 0.2),
        decoration: BoxDecoration(
            border: Border.all(width: 0.25, color: Colors.blueGrey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(height: context.getHeight * 0.08),
            VasseurrTFF(
              labelText: "Username",
              hintText: "Vasseurr",
              filled: true,
            ),
            SizedBox(height: context.getHeight * 0.05),
            VasseurrTFF(
              labelText: "Email",
              hintText: "vasseurr@gmail.com",
              filled: true,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: context.getHeight * 0.05),
            VasseurrTFF(
              labelText: "Password",
              hintText: "vasseurr",
              filled: true,
              textInputAction: TextInputAction.done,
              obsecureText: true,
            ),
            SizedBox(height: context.getHeight * 0.05),
            VasseurrBttn(
                buttonHeight: context.getHeight * 0.05,
                buttonColor: Colors.redAccent.shade400,
                borderColor: Colors.redAccent.shade400,
                borderRadius: 8,
                buttonText: "Create Account",
                onpressed: () {})
          ]),
        ),
      ),
    );
  }

  Container _background(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.redAccent.shade400,
              //   Color.fromRGBO(241, 55, 78, 1),
              Colors.redAccent.shade100
            ]),
        //   color: Colors.redAccent.shade400,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      height: context.getHeight * 0.4,
    );
  }
}
