import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zerozilla_test/src/home/data/datasources/circle_list.dart';
import 'package:zerozilla_test/src/home/data/datasources/divistion.dart';
import 'package:zerozilla_test/src/home/data/datasources/sub_division.dart';

import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/common_widgets.dart/button_widget.dart';
import '../../../config/constants/colors.dart';
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
            circleDropdown(),
            divDropdown(),
            divDropdown(),
            ButtonWidget(
              buttonName: StringConstants.confirm,
              isValidated: true,
              onpressed: () {
                context.popRoute();
              },
            ),
            ButtonWidgetRed(
              buttonName: StringConstants.cancel,
              onpressed: () {
                context.popRoute();
              },
            )
          ],
        ),
      ),
    );
  }

  Column circleDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Select Circle",
            style: AppTextStyle.normalStyle(fontColor: CColors.black152e22),
          ),
        ),
        DropdownButtonFormField(
          padding: const EdgeInsets.all(12),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: CColors.greenMain118c55, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: CColors.white, width: 2),
              ),
              filled: true,
              fillColor: Colors.white),
          dropdownColor: Colors.white,
          value: drop1,
          onChanged: (String? newValue) {
            setState(() {
              drop1 = newValue!;
            });
          },
          items: circleList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Column divDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Select Division",
            style: AppTextStyle.normalStyle(fontColor: CColors.black152e22),
          ),
        ),
        DropdownButtonFormField(
          padding: const EdgeInsets.all(12),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: CColors.greenMain118c55, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: CColors.white, width: 2),
              ),
              filled: true,
              fillColor: Colors.white),
          dropdownColor: Colors.white,
          value: drop2,
          onChanged: (String? newValue) {
            setState(() {
              drop2 = newValue!;
            });
          },
          items: divisionList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Column dubDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Select Sub Division",
            style: AppTextStyle.normalDesc(fontColor: CColors.black152e22),
          ),
        ),
        DropdownButtonFormField(
          padding: const EdgeInsets.all(12),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: CColors.greenMain118c55, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: CColors.white, width: 2),
              ),
              filled: true,
              fillColor: Colors.white),
          dropdownColor: Colors.white,
          value: drop3,
          onChanged: (String? newValue) {
            setState(() {
              drop3 = newValue!;
            });
          },
          items: subDivisionList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String drop1 = 'Kodaku';
  String drop2 = "Bandipura";
  String drop3 = "Somwarpet";
}
