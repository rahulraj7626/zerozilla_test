import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/app_styles.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/padding.dart';
import 'package:zerozilla_test/src/config/constants/colors.dart';
import '../../../config/common_widgets.dart/font_size.dart';
import '../widgets/appbar_widget.dart';

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
              itemCount: 4,
              itemBuilder: (context, index) => rowItem(),
            ),
          ),
          Expanded(
            child: Material(
              elevation: 40.0,
              shape: const CircleBorder(),
              shadowColor: Colors.green,
              child: CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 4.0,
                  percent: 0.60,
                  center: Text("Cnter%"),
                  progressColor: Colors.green,
                  rotateLinearGradient: true,
                  circularStrokeCap: CircularStrokeCap.round),
            ),
          ),
          Text(
            "Updated 28 min ago",
            style: AppTextStyle.normalStyle(fontColor: CColors.grey),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => greenItem(),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ]),
      ),
    );
  }

  Container rowItem() {
    return Container(
      width: 80,
      margin: Ppadding.defualtPadding,
      child: Column(children: [
        Icon(
          Icons.notifications,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Battery\nVoltage",
            style: AppTextStyle.normalStyle(fontSize: FontSize.smallFont),
          ),
        ),
        Text(
          "25.64 Kv",
          style: AppTextStyle.normalStyle(),
        )
      ]),
    );
  }

  Container greenItem() {
    return Container(
      width: 110,
      margin: Ppadding.defualtPadding,
      decoration: BoxDecoration(
          color: CColors.darkGreen, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Icon(Icons.bubble_chart, size: 60, color: CColors.white),
        Text(
          "Network\nStrength",
          style: AppTextStyle.normalStyle(fontColor: CColors.white),
        ),
        Text(
          "16",
          style: AppTextStyle.largeStyle(fontColor: CColors.white),
        )
      ]),
    );
  }
}
