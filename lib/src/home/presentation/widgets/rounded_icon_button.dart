import 'package:flutter/material.dart';

import '../../../config/constants/colors.dart';

Padding roundedIconButton(IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.grey, // <-- Button color
        foregroundColor: Colors.black, // <-- Splash color
      ),
      child: Icon(icon, color: CColors.black152e22),
    ),
  );
}
