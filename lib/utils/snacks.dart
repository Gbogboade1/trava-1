import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:trava/style/colors.dart';

const List<Color> _colors = [
  TravaColors.black,
  TravaColors.red,
  TravaColors.purple,
  TravaColors.green,
  TravaColors.yellow,
];

showSnack({
  required BuildContext context,
  required String message,
  SnackType type = SnackType.warning,
  bool isFloating = true,
}) {
  if (Platform.isIOS) {
    isFloating = false;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: TravaColors.white,
        ),
      ),
      backgroundColor: _colors[SnackType.values.indexOf(type)],
    ),
  );
}

enum SnackType { def, error, info, success, warning }
