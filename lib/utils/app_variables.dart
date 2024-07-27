import 'package:flutter/material.dart';

WidgetStateProperty<Color?> buttonColor =
    WidgetStateProperty.resolveWith<Color?>(
  (Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return Colors.white;
    }
    return const Color(0xff0b54bf);
  },
);
