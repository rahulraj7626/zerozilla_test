import 'package:flutter/material.dart';

import '../../../config/common_widgets.dart/app_styles.dart';

SizedBox topItem(icon, title, count, color) {
  return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: color,
            size: 35,
          ),
          Text(
            title,
            style: AppTextStyle.normalStyle(),
          ),
          Text(
            count,
            style: AppTextStyle.largeStyle(),
          )
        ],
      ));
}
