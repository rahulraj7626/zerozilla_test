import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/button_widget.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/padding.dart';
import 'package:zerozilla_test/src/config/constants/asset_constants.dart';
import 'package:zerozilla_test/src/config/constants/enums.dart';
import 'package:zerozilla_test/src/config/constants/string_constants.dart';
import 'package:zerozilla_test/src/home/presentation/pages/home.dart';

import '../../../../route_manager/route_imports.gr.dart';
import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/common_widgets.dart/text_form_fiels.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        child: Form(
          key: formKeyLogin,
          child: Column(children: [
            SizedBox(
              height: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.asset(
                  Iimages.loginImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Image.asset(
                Iimages.logoImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                StringConstants.fenceMonitoring,
                style: AppTextStyle.largeStyle(),
              ),
            ),
            TextFieldWidget(
                hint: StringConstants.userName,
                controller: usernameController,
                secure: false,
                type: InputType.normal,
                errMsg: "Username required *"),
            TextFieldWidget(
                hint: StringConstants.password,
                controller: passwordController,
                secure: true,
                type: InputType.password,
                errMsg: "Password required *"),
            Padding(
              padding: Ppadding.defualtPadding,
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(StringConstants.rememberMe),
                  Spacer(),
                  Text(StringConstants.forgotPassword),
                ],
              ),
            ),
            ButtonWidget(
              buttonName: StringConstants.login,
              onpressed: () {
                context.replaceRoute(HomeScreenRoute());
              },
            )
          ]),
        ),
      ),
    );
  }
}

final formKeyLogin = GlobalKey<FormState>();
final usernameController = TextEditingController();
final passwordController = TextEditingController();
