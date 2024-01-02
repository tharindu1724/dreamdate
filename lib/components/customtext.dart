import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.color = Colors.white,
    required this.fontSize,
    required this.fontWeight,
    super.key,
  });

  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
