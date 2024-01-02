import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customtext.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    required this.text,
    required this.borderRadius,
    this.color= const Color.fromARGB(255, 40, 42, 43),
    super.key,
    required this.screenWidth,
  });

  final String text;
  final double screenWidth;
  final Color color;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: screenWidth * 0.20,
      width: screenWidth * 0.75,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: Center(
        child:
            CustomText(text: text, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
