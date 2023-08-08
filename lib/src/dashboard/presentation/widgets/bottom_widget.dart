import 'package:flutter/material.dart';

import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/common_widgets.dart/padding.dart';
import '../../../config/constants/colors.dart';

Container greenItem(
  icon,
  title,
  count,
) {
  return Container(
    width: 110,
    margin: Ppadding.defualtPadding,
    decoration: BoxDecoration(
        color: CColors.darkGreen, borderRadius: BorderRadius.circular(12)),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Icon(icon, size: 40, color: CColors.white),
      Text(
        title,
        style: AppTextStyle.normalStyle(fontColor: CColors.white),
      ),
      Text(
        count,
        style: AppTextStyle.largeStyle(fontColor: CColors.white),
      ),
      const SizedBox()
    ]),
  );
}
