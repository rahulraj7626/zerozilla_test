import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zerozilla_test/src/home/data/models/notification_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SearchData>((event, emit) async {
      emit(LoadingState());
      List<NotificationModel> searchDataList =
          search(event.keyy, event.listData);
      if (searchDataList.isEmpty) {
        emit(NodataState());
        emit(SearchedState(allData: searchDataList, tResult: event.listData));
      } else {
        emit(SearchedState(allData: searchDataList, tResult: event.listData));
      }
    });
  }
}

List<NotificationModel> search(searchKey, List<NotificationModel>? data) {
  List<NotificationModel>? tData = data;
  List<NotificationModel>? repoModelData = tData;

  List<NotificationModel> searchList = [];
  if (repoModelData!.isNotEmpty) {
    for (int i = 0; i < repoModelData.length; i++) {
      if (repoModelData[i]
          .name
          .toLowerCase()
          .contains(searchKey.toString().toLowerCase())) {
        searchList.add(repoModelData[i]);
      }
    }

    repoModelData = searchList;
  }
  return repoModelData;
}
