import 'package:epingo/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BigBlueButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const BigBlueButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: const Color(0xff0b54bf),
            padding: const EdgeInsets.all(12),
          ),
          onPressed: onPressed,
          child: CustomText(text: text, size: 18, color: "FFFFFF")),
    );
  }
}
