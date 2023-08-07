import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/constants/colors.dart';

AppBar appbarWidget(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
        onPressed: () => context.popRoute(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: CColors.greenMain118c55,
        )),
    title: Text(
      "Bandebetta tw mian Road",
      style: AppTextStyle.normalStyle(fontColor: CColors.black152e22),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notification_add,
            color: CColors.blue,
          ))
    ],
  );
}
