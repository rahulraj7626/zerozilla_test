import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerozilla_test/src/config/common_widgets.dart/padding.dart';
import 'package:zerozilla_test/src/config/constants/colors.dart';
import 'package:zerozilla_test/src/config/constants/string_constants.dart';
import 'package:zerozilla_test/src/home/data/datasources/notification_list.dart';
import 'package:zerozilla_test/src/home/presentation/bloc/home_bloc.dart';

import '../../../config/common_widgets.dart/app_styles.dart';
import '../../data/models/notification_model.dart';
import '../widgets/search_widget.dart';

@RoutePage()
class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.white,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => context.popRoute(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: CColors.darkGreen,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Notifications",
            style: AppTextStyle.largeStyle(fontColor: CColors.black152e22),
          )),
      body: Column(
        children: [
          const SearchWidget(
            hint: 'Search',
          ),
          Expanded(
            child: BlocBuilder(
              bloc: BlocProvider.of<HomeBloc>(context),
              builder: (BuildContext context, HomeState state) {
                if (state is HomeInitial) {
                  context.read<HomeBloc>().add(
                        SearchData(keyy: "", listData: notificationList),
                      );
                  return const CircularProgressIndicator();
                }
                if (state is SearchedState) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.allData.isEmpty ? 0 : state.allData.length,
                    itemBuilder: (context, index) {
                      return listItem(index, state.allData);
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Container listItem(int index, List<NotificationModel> list) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: Ppadding.defualtPadding,
      padding: Ppadding.defualtPadding,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: list[index].type.contains(StringConstants.working)
                    ? CColors.lightGreenecfef3
                    : list[index].type.contains(StringConstants.faulty)
                        ? CColors.lightYellow
                        : CColors.lightBlueeff8ff),
            child: Icon(
              list[index].type.contains(StringConstants.working)
                  ? Icons.shield_moon_outlined
                  : list[index].type.contains(StringConstants.faulty)
                      ? Icons.warning_rounded
                      : Icons.lightbulb_circle,
              color: list[index].type.contains(StringConstants.working)
                  ? CColors.darkGreen
                  : list[index].type.contains(StringConstants.faulty)
                      ? CColors.yellow
                      : CColors.red,
            ),
          ),
          Expanded(
            child: Text(
              list[index].name,
              style: AppTextStyle.largeStyle(fontColor: CColors.black152e22),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
              color: CColors.blue)
        ],
      ),
    );
  }
}
