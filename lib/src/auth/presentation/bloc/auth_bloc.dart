import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<ValidationREvent>((event, emit) {
      if (event.isValidated) {
        emit(ValidatedState());
      } else {
        emit(NotValidatedState());
      }
    });
  }
}
