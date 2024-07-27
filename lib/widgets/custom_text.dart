import 'package:epingo/utils/useful_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final String color;
  const CustomText(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return color.isNotEmpty
        ? Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: size + 0.05,
                color: hexToColor(color),
                fontWeight: (size >= 18) ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          )
        : Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: size + 0.05,
                color: const Color(0xff2C3351),
                fontWeight: (size >= 18) ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          );
  }
}
