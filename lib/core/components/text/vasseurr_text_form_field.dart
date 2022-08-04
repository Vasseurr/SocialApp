import 'package:flutter/material.dart';

class VasseurrTFF extends StatelessWidget {
  double? width;
  double? height;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  Color? cursorColor;
  Color? labelTextColor;
  Color? hintTextColor;
  Color? textColor;
  Color? borderColor;
  Color? fillColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hintText;
  String? labelText;
  String? helperText;
  FocusNode? focusNode;
  int? maxLength;
  int? maxLines;
  double? radius;
  double? fontSize;
  double? borderWidth;
  bool? filled;
  bool? autoFocus;
  bool? obsecureText;
  TextEditingController? textEditingController;
  Function(String)? onChanged;
  Function(String? value)? onSaved;
  String? Function(String? value)? validator;

  VasseurrTFF(
      {Key? key,
      this.height,
      this.width,
      this.textInputAction,
      this.textInputType,
      this.textEditingController,
      this.cursorColor,
      this.labelTextColor,
      this.hintTextColor,
      this.hintText,
      this.fillColor,
      this.textColor,
      this.borderColor,
      this.helperText,
      this.labelText,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.maxLength,
      this.maxLines,
      this.radius,
      this.focusNode,
      this.fontSize,
      this.borderWidth,
      this.filled,
      this.autoFocus,
      this.obsecureText,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 350,
      height: height ?? 50,
      child: TextFormField(
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        controller: textEditingController,
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        onChanged: onChanged,
        obscureText: obsecureText ?? false,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        cursorColor: cursorColor ?? Colors.orangeAccent.shade400,
        decoration: InputDecoration(
          helperText: helperText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: fillColor ?? Colors.white,
          filled: filled ?? false,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: BorderSide(
                color: borderColor ?? Colors.grey.shade200,
                width: borderWidth ?? 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: BorderSide(
                color: borderColor ?? Colors.grey.shade200,
                width: borderWidth ?? 1.0),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelStyle: TextStyle(
            color: labelTextColor ?? Colors.grey.shade700,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
          hintStyle: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: hintTextColor ?? Colors.grey),
          labelText: labelText,
        ),
        style: TextStyle(
            color: textColor ?? Colors.black,
            fontFamily: "Poppins",
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w400),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
