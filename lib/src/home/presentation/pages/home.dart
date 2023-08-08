import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zerozilla_test/route_manager/route_imports.gr.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/app_styles.dart';
import 'package:zerozilla_test/src/config/constants/colors.dart';
import 'package:zerozilla_test/src/config/constants/string_constants.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/home_item.dart';
import '../widgets/top_item.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      onTap: () => locationBottomSheet(context, () {}),
                      titleAlignment: ListTileTitleAlignment.center,
                      leading: Icon(
                        Icons.location_city,
                        size: 35,
                        color: CColors.darkGreen,
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "Madikeri",
                            style: AppTextStyle.largeStyle(
                                fontColor: CColors.black152e22),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              Icons.arrow_drop_down_circle,
                              color: CColors.darkGreen,
                            ),
                          )
                        ],
                      ),
                      title: Text(
                        "Division office",
                        style: AppTextStyle.normalDesc(fontColor: CColors.grey),
                      ),
                      trailing: GestureDetector(
                        onTap: () =>
                            context.pushRoute(const NotificationRoute()),
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: CColors.darkGreen,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          "Fence details",
                          style: AppTextStyle.largeStyle(
                              fontColor: CColors.black152e22),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        topItem(Icons.shield_moon_outlined,
                            StringConstants.working, "12", CColors.darkGreen),
                        topItem(Icons.warning_rounded, StringConstants.working,
                            "23", CColors.yellow),
                        topItem(Icons.lightbulb_circle, StringConstants.working,
                            "2", CColors.red)
                      ],
                    ),
                    const SizedBox()
                  ]),
            ),
            GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: gridList)
          ]),
        ),
      ),
      bottomSheet: bottomWidget(context),
    );
  }
}

List<Widget> gridList = [
  homeItem(true, Icons.bolt, StringConstants.energizer, "5"),
  homeItem(false, Icons.radio_button_checked, StringConstants.fence, "5"),
  homeItem(false, Icons.sunny, StringConstants.solar, "5"),
  homeItem(false, Icons.battery_saver_outlined, StringConstants.battery, "5"),
];
