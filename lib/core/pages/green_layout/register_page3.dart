import 'package:flutter/material.dart';
import '../../components/buttons/vasseurr_button.dart';
import '../../components/text/vasseurr_text_form_field.dart';
import '../../extension/context_extension.dart';

class RegisterPage3 extends StatelessWidget {
  RegisterPage3({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  Color green = const Color.fromRGBO(49, 211, 124, 1);
  Color backgroundColor = const Color.fromRGBO(236, 236, 238, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _background(context),
            _header(context),
            _form(context),
            _signInText(context)
          ],
        ));
  }

  Container _signInText(BuildContext context) {
    return Container(
      height: context.getHeight * 0.6,
      margin: EdgeInsets.only(
          top: context.getHeight * 0.94,
          left: context.getWidth * 0.1,
          right: context.getWidth * 0.1),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Have you already account? "),
          InkWell(
            onTap: () {},
            child: Text(
              "Sign In",
              style: TextStyle(color: green),
            ),
          ),
        ],
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
        width: context.getWidth * 0.5,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWidth * 0.05,
            vertical: context.getHeight * 0.08),
        child: Text("Let's Start with Sign Up",
            style: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.black, fontSizeFactor: 1.25)
                .headline5));
  }

  Form _form(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
        height: context.getHeight * 0.7,
        width: context.getWidth * 0.8,
        margin: EdgeInsets.only(
          top: context.getHeight * 0.21,
          left: context.getWidth * 0.1,
          right: context.getWidth * 0.1,
        ),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
                height: context.getHeight * 0.2,
                child: Image.asset("assets/images/v.png")),
            VasseurrTFF(
              prefixIcon: Icon(Icons.person_pin, color: green),
              hintText: "First & Last Name",
              filled: true,
            ),
            SizedBox(height: context.getHeight * 0.02),
            VasseurrTFF(
              prefixIcon: Icon(Icons.email_outlined, color: green),
              hintText: "Email",
              filled: true,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: context.getHeight * 0.02),
            VasseurrTFF(
              prefixIcon: Icon(Icons.phone_android, color: green),
              hintText: "Phone Number",
              filled: true,
              textInputType: TextInputType.number,
            ),
            SizedBox(height: context.getHeight * 0.02),
            VasseurrTFF(
              prefixIcon: Icon(Icons.lock, color: green),
              hintText: "Password",
              filled: true,
              textInputAction: TextInputAction.done,
              obsecureText: true,
            ),
            SizedBox(height: context.getHeight * 0.02),
            VasseurrBttn(
                buttonHeight: context.getHeight * 0.05,
                buttonColor: green,
                borderColor: green,
                borderRadius: 8,
                buttonText: "Sign Up",
                onpressed: () {})
          ]),
        ),
      ),
    );
  }

  Container _background(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.getHeight * 0.5),
      decoration: BoxDecoration(
        color: green,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
      ),
      height: context.getHeight * 0.5,
    );
  }
}
