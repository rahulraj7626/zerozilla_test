import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/common_widgets.dart/button_widget.dart';
import '../../../config/constants/string_constants.dart';

class LocationWidget extends StatefulWidget {
  final Function() onChanged;
  const LocationWidget({super.key, required this.onChanged});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("fjhgvjfhjhf"),
            GestureDetector(
              onTap: () {
                widget.onChanged();
                context.popRoute();
              },
              child: Text(
                " StringConstants.delete,",
                style: AppTextStyle.normalStyle(),
              ),
            ),
            GestureDetector(
              onTap: () => context.popRoute(),
              child: Text(
                "jfjf",
                style: AppTextStyle.normalStyle(),
              ),
            ),
            ButtonWidget(
              buttonName: StringConstants.confirm,
              isValidated: true,
              onpressed: () {},
            ),
            ButtonWidgetRed(
              buttonName: StringConstants.cancel,
              onpressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
