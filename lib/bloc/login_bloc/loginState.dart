part of 'loginBloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateLoading extends LoginState {}

class LoginStateOpenedSession extends LoginState {
  final UserModel userModel;

  UserModel get getUserModel => userModel;

  LoginStateOpenedSession({required this.userModel});
}

class LoginStateClosedSession extends LoginState {}

class LoginStateError extends LoginState {}
