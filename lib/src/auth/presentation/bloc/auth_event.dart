part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class ValidationREvent extends AuthEvent {
  final bool isValidated;

  const ValidationREvent(this.isValidated);
}
