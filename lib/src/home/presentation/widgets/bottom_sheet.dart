import 'package:flutter/material.dart';

import 'bottom_sheet_widget.dart';

locationBottomSheet(BuildContext context, final Function() onChanged) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (builder) {
        return Container(
            height: MediaQuery.of(context).size.height < 700.0
                ? MediaQuery.of(context).size.height * 0.85
                : MediaQuery.of(context).size.height * 0.75,
            color: Colors.transparent,
            child: LocationWidget(
              onChanged: () => onChanged(),
            ));
      });
}
