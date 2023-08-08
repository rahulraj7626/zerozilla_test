import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/app_styles.dart';
import 'package:zerozilla_test/src/config/constants/colors.dart';
import 'package:zerozilla_test/src/config/constants/string_constants.dart';
import 'package:zerozilla_test/src/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/top_widget.dart';

@RoutePage()
class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(context),
      body: Container(
        child: Column(children: [
          SizedBox(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topWidgetList.length,
                itemBuilder: (context, index) => topWidgetList[index]),
          ),
          BlocBuilder(
            bloc: BlocProvider.of<DashboardBloc>(context),
            builder: (BuildContext context, DashboardState state) {
              if (state is SwitchOnState || state is DashboardInitial) {
                return progressWidget(
                    context, true, StringConstants.valueProgress);
              } else {
                return progressWidget(
                    context, false, StringConstants.switchOff);
              }
            },
          ),
          Text(
            "Updated 28 min ago",
            style: AppTextStyle.normalStyle(fontColor: CColors.grey),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bottomWidgetList.length,
              itemBuilder: (context, index) => bottomWidgetList[index],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ]),
      ),
    );
  }

  Expanded progressWidget(BuildContext context, isOn, title) {
    final color = isOn ? CColors.darkGreen : CColors.red;
    return Expanded(
      child: Material(
        elevation: 40.0,
        shape: const CircleBorder(),
        shadowColor: color,
        child: CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 4.0,
            percent: 0.60,
            center: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.largeStyle(
                  fontColor: isOn ? CColors.black152e22 : CColors.red),
            ),
            progressColor: color,
            rotateLinearGradient: true,
            circularStrokeCap: CircularStrokeCap.round),
      ),
    );
  }
}

List<Widget> bottomWidgetList = [
  greenItem(
    Icons.network_cell,
    StringConstants.networkStrength,
    "16",
  ),
  greenItem(
    Icons.earbuds_battery,
    StringConstants.batteryCharg,
    "On",
  ),
  greenItem(
    Icons.electrical_services_sharp,
    StringConstants.fenceCurrent,
    "1.25",
  ),
];

List<Widget> topWidgetList = [
  rowItem(Icons.amp_stories, StringConstants.batteryVolt, "25.04 V", true),
  rowItem(Icons.fence, StringConstants.fenceVolt, "4.42 kV", false),
  rowItem(Icons.solar_power, StringConstants.solarVolt, "24 V", false),
  rowItem(Icons.sunny, StringConstants.solarCurrent, "24 A", false),
];
