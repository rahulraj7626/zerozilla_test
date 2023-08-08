import 'package:flutter/material.dart';
import 'package:zerozilla_test/src/config/constants/colors.dart';

import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/common_widgets.dart/font_size.dart';
import '../../../config/common_widgets.dart/padding.dart';

Container rowItem(icon, title, count, bool isSelected) {
  final color = isSelected ? CColors.black152e22 : CColors.grey;
  return Container(
    width: 80,
    margin: Ppadding.defualtPadding,
    child: Column(children: [
      Icon(icon, size: 45, color: color),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          title,
          style: AppTextStyle.normalStyle(
              fontColor: color, fontSize: FontSize.smallFont),
        ),
      ),
      Text(
        count,
        style: AppTextStyle.normalStyle(fontColor: color),
      )
    ]),
  );
}
