part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<NotificationModel>? allNotification;
  final List<NotificationModel>? tempList;
  const HomeState({
    this.allNotification = const <NotificationModel>[],
    this.tempList = const <NotificationModel>[],
  });

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class SearchedState extends HomeState {
  final List<NotificationModel> allData;
  final List<NotificationModel>? tResult;
  const SearchedState({
    required this.allData,
    required this.tResult,
  }) : super(allNotification: allData, tempList: tResult);
}

class NodataState extends HomeState {}

class LoadingState extends HomeState {}
