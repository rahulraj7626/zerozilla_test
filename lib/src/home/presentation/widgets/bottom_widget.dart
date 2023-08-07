import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zerozilla_test/route_manager/route_imports.gr.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/app_styles.dart';

import '../../../config/constants/colors.dart';
import 'rounded_icon_button.dart';

Container bottomWidget(BuildContext context) {
  return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: CColors.greenMain118c55,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
              onTap: () => context.pushRoute(const DashBoardScreenRoute()),
              child: dashBoardButton()),
          const Spacer(),
          roundedIconButton(Icons.blur_linear),
          roundedIconButton(Icons.person, )
        ],
      ));
}

Container dashBoardButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), color: Colors.white),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Icon(Icons.pie_chart, color: CColors.greenMain118c55),
      const SizedBox(
        width: 12,
      ),
      Text(
        "Dashboard",
        style: AppTextStyle.normalStyle(),
      )
    ]),
  );
}
