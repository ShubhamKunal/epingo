import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.obscureText) {
      case true:
        return SizedBox(
          height: 48,
          child: TextFormField(
            controller: widget.controller,
            obscureText: show,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffFCFCFC),
              hintText: widget.hintText,
              labelStyle: GoogleFonts.poppins(fontSize: 16),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
                icon: Icon(
                  show ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                ),
              ),
            ),
          ),
        );
      case false:
      default:
        return SizedBox(
          height: 48,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              filled: true,
              fillColor: const Color(0xffFCFCFC),
              hintText: widget.hintText,
              labelStyle: GoogleFonts.poppins(fontSize: 16),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        );
    }
  }
}
