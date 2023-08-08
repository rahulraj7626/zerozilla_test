import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'app_styles.dart';
import 'padding.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final double? fontSize;
  final double? height;
  final bool isValidated;

  final void Function()? onpressed;

  const ButtonWidget({
    Key? key,
    required this.buttonName,
    this.fontSize,
    this.height,
    this.onpressed,
    required this.isValidated,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Ppadding.defualtPadding,
      child: ElevatedButton(
        onPressed: isValidated ? onpressed : null,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
            CColors.greenMain118c55,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 0),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: isValidated ? CColors.greenMain118c55 : CColors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Container(
              constraints: BoxConstraints(
                minWidth: 88.0,
                minHeight: height ?? 50,
              ),
              alignment: Alignment.center,
              child: Text(
                buttonName,
                style: AppTextStyle.normalDesc(
                    fontColor: Colors.white, fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}
