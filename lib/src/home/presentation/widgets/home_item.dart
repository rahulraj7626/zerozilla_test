import 'package:flutter/material.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/font_size.dart';

import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/constants/colors.dart';

Container homeItem(bool isSelected, icon, title, count) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
        color: isSelected ? CColors.greenMain118c55 : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(width: 2, color: CColors.grey.withOpacity(0.3))),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon,
              size: 40, color: isSelected ? Colors.white : CColors.black152e22),
          Text(
            title,
            style: AppTextStyle.normalStyle(
                fontColor: isSelected ? Colors.white : CColors.black152e22),
          ),
          Text(
            count,
            style: AppTextStyle.largeStyle(
                fontSize: FontSize.extraLargeFont,
                fontColor: isSelected ? Colors.white : CColors.black152e22),
          )
        ]),
  );
}
