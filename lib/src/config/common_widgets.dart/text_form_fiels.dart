import 'package:flutter/material.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/padding.dart';

import '../../auth/domain/usecases/validators.dart';
import '../constants/colors.dart';
import '../constants/enums.dart';
import 'app_styles.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController? confirm;
  final TextEditingController controller;
  final bool secure;
  final String errMsg;
  final bool? isCapitalize;
  final InputType type;
  final bool? readOnly;

  const TextFieldWidget({
    Key? key,
    required this.hint,
    this.confirm,
    required this.controller,
    required this.secure,
    required this.errMsg,
    required this.type,
    this.readOnly,
    this.isCapitalize,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  void _viewPass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Ppadding.defualtPadding,
      child: TextFormField(
        // style: GoogleFonts.poppins(
        //   textStyle: TextFieldWidget.txtStyle,
        // ),

        cursorColor: CColors.black152e22,
        onChanged: (value) {
          if (widget.controller.text != value.toUpperCase() &&
              widget.isCapitalize == true) {
            widget.controller.value =
                widget.controller.value.copyWith(text: value.toUpperCase());
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,

        textCapitalization: widget.isCapitalize == true
            ? TextCapitalization.characters
            : TextCapitalization.none,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.type == InputType.email
            ? TextInputType.emailAddress
            : TextInputType.text,
        obscureText: widget.secure == true ? _obscureText : false,
        decoration: InputDecoration(
            errorMaxLines: 2,
            filled: true,
            suffixIcon: widget.secure == true
                ? GestureDetector(
                    onTap: () {
                      _viewPass();
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: CColors.grey),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CColors.grey,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CColors.grey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CColors.blue,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: CColors.blue,
                width: 1.0,
              ),
            ),
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: widget.hint,
            hintStyle: AppTextStyle.normalDesc(fontColor: CColors.black152e22),
            fillColor: Colors.white),

        validator: (value) {
          if (value!.isEmpty) {
            return widget.errMsg;
          } else if (widget.secure == true &&
              widget.confirm == null &&
              AuthHelpers().isPasswordFn(value) == false) {
            return "Password should be a minimum of 5 characters ";
          } else if (widget.type == InputType.email &&
              AuthHelpers().isEmailFn(value) == false) {
            return "Invalid Email";
          } else if (widget.confirm != null &&
              AuthHelpers().confirmPassword(value, widget.confirm!.text) ==
                  false) {
            return "Password does not match";
          }

          return null;
        },
      ),
    );
  }
}
