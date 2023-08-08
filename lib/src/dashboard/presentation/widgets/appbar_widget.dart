import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/common_widgets.dart/app_styles.dart';
import '../../../config/constants/colors.dart';
import '../bloc/dashboard_bloc.dart';
import 'custom_switch.dart';

AppBar appbarWidget(
  BuildContext context,
) {
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
      BlocBuilder(
        bloc: BlocProvider.of<DashboardBloc>(context),
        builder: (BuildContext context, DashboardState state) {
          if (state is SwitchOnState || state is DashboardInitial) {
            return switchWidget(context, true);
          } else {
            return switchWidget(context, false);
          }
        },
      ),
    ],
  );
}
