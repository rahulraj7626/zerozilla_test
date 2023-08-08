part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchData extends HomeEvent {
  final String? keyy;
  final List<NotificationModel>? listData;

  const SearchData({
    this.keyy,
    this.listData,
  });
}
