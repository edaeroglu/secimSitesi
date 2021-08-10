part of 'loginBloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// Giriş yapan kullanıcının olup olmadığını sorgular.
class LoginEventFetch extends LoginEvent {}

/// kullanıcı girişi icin kullanılır. String türünden constraction (userMail, userPassword) alır.
class LoginEventSingIn extends LoginEvent {
  final String userMail;
  final String userPassword;

  LoginEventSingIn({required this.userMail, required this.userPassword});
}

/// anonim girişi icin kullanılır. String türünden constraction (userMail) alır.
class AnonymLoginEventSingIn extends LoginEvent {
  final String userMail;

  AnonymLoginEventSingIn({required this.userMail,});
}


/// yeni kullanıcı kaydı için kullanılır. UserModel türünden bir constraction alır.
class LoginEventSingUp extends LoginEvent {
  final UserModel userModel;

  LoginEventSingUp({required this.userModel});
}
