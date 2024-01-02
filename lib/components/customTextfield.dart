import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customtext.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.screenWidth,
      required this.text,
      required this.icon,
      this.isPassword = false,
      required this.controller});

  final double screenWidth;
  final String text;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth * 0.90,
      child: TextField(
        obscureText: isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
            label: CustomText(
              text: widget.text,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off))
                : null,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(60)))),
      ),
    );
  }
}
