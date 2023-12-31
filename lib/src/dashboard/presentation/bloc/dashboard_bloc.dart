import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<SwitchEvent>((event, emit) {
      if (event.isOn) {
        emit(SwitchOnState());
      } else {
        emit(SwitchOffState());
      }
    });
  }
}
