import 'package:flutter/material.dart';
import '../../core/components/buttons/custom_button.dart';

import '../../core/components/text/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color primary = Colors.blueAccent.shade400;
  Color secondary = Colors.blueAccent.shade100;
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          header(context),
          const SizedBox(height: 20),
          options(),
          const SizedBox(height: 20),
          isLogin == true ? loginTFF(context) : registerTFF(context),
          const SizedBox(height: 30),
          isLogin == true
              ? button("LOGIN", context)
              : button("REGISTER", context),
          //const SizedBox(height: 30),
          // loginButton(primary)
        ],
      ),
    );
  }

  Column registerTFF(BuildContext context) {
    return Column(
      children: [
        textField("Fullname", const Icon(Icons.person), context),
        textField("Email", const Icon(Icons.email), context),
        textField("Phone Number", const Icon(Icons.phone), context),
        textField("Password", const Icon(Icons.vpn_key), context),
      ],
    );
  }

  Column loginTFF(BuildContext context) {
    return Column(
      children: [
        textField("Email", const Icon(Icons.email), context),
        textField("Password", const Icon(Icons.vpn_key), context),
      ],
    );
  }

  Row options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isLogin = false;
            });
          },
          child: Text("Sign Up",
              style: TextStyle(
                  color: isLogin == false ? primary : secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isLogin = true;
            });
          },
          child: Text("Sign In",
              style: TextStyle(
                  color: isLogin == true ? primary : secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
      ],
    );
  }

  Row loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already a member? "),
        Text(
          "Login ",
          style: TextStyle(color: primary, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  button(String text, BuildContext context) {
    return CustomBttn(
        width: MediaQuery.of(context).size.width * 0.8,
        radius: 20,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        buttonColor: primary,
        borderColor: Colors.white,
        buttonText: text,
        onPressed: () {});
  }

  textField(String hintText, Icon icon, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.08,
      child: CustomTFF(
        icon: icon,
        hintText: hintText,
        hintColor: Colors.grey,
        fontSize: 18,
        borderColor: Colors.grey.shade200,
        fillColor: Colors.white,
        radius: 50,
        onSaved: (value) => (value),
        textInputAction: hintText != "Password"
            ? TextInputAction.next
            : TextInputAction.done,
        keyboardType: hintText != "Phone Number"
            ? TextInputType.text
            : TextInputType.number,
        obsecureText: hintText != "Password" ? false : true,
      ),
    );
  }

  Container header(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: primary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(120),
          )),
      child: Image.asset(
        "assets/images/v.png",
      ),
    );
  }
}
