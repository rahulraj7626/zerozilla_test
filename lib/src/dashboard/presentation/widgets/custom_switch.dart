import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../config/constants/colors.dart';
import '../bloc/dashboard_bloc.dart';

SizedBox switchWidget(BuildContext context, isOn) {
  return SizedBox(
    width: 85,
    child: FlutterSwitch(
      height: 40.0,
      padding: 8.0,
      toggleSize: 25.0,
      showOnOff: true,
      borderRadius: 30.0,
      activeColor: CColors.darkGreen,
      inactiveColor: CColors.red,
      value: isOn,
      onToggle: (value) {
        context.read<DashboardBloc>().add(SwitchEvent(value));
      },
    ),
  );
}
