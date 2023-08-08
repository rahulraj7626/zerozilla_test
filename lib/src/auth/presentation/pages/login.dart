import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerozilla_test/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/button_widget.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/padding.dart';
import 'package:zerozilla_test/src/config/constants/asset_constants.dart';
import 'package:zerozilla_test/src/config/constants/enums.dart';
import 'package:zerozilla_test/src/config/constants/string_constants.dart';

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
      body: Form(
        key: formKeyLogin,
        child: SingleChildScrollView(
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
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 100,
              child: Image.asset(
                Iimages.logoImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                StringConstants.fenceMonitoring,
                style: AppTextStyle.largeStyle(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              hint: StringConstants.userName,
              controller: usernameController,
              secure: false,
              type: InputType.normal,
              errMsg: "Username required *",
              onChangeFn: (p0) {
                validate(context);
              },
            ),
            TextFieldWidget(
              hint: StringConstants.password,
              controller: passwordController,
              secure: true,
              type: InputType.password,
              errMsg: "Password required *",
              onChangeFn: (p0) {
                validate(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: Ppadding.defualtPadding,
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const Text(StringConstants.rememberMe),
                  const Spacer(),
                  const Text(StringConstants.forgotPassword),
                ],
              ),
            ),
            BlocBuilder(
              bloc: BlocProvider.of<AuthBloc>(context),
              builder: (BuildContext context, AuthState state) {
                if (state is ValidatedState) {
                  return buttonWidget(context, true);
                } else {
                  return buttonWidget(context, false);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }

  ButtonWidget buttonWidget(BuildContext context, bool isValidated) {
    return ButtonWidget(
      buttonName: StringConstants.login,
      isValidated: isValidated,
      onpressed: () {
        context.replaceRoute(const HomeScreenRoute());
      },
    );
  }
}

validate(BuildContext context) {
  if (formKeyLogin.currentState!.validate()) {
    context.read<AuthBloc>().add(const ValidationREvent(true));
  } else {
    context.read<AuthBloc>().add(const ValidationREvent(false));
  }
}

final formKeyLogin = GlobalKey<FormState>();
final usernameController = TextEditingController();
final passwordController = TextEditingController();
