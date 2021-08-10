import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_page_day_23/helpers/locator.dart';
import 'package:login_page_day_23/model/usersModel.dart';
import 'package:login_page_day_23/repositories/userRepo.dart';
import 'package:login_page_day_23/services/prefService.dart';

part 'loginEvent.dart';
part 'loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginStateLoading());
  final _userRepository = locator<UserRepository>();
  final _prefService = locator<PrefService>();

  UserModel? _userModel;
  UserModel? get getUserModel => _userModel;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEventFetch) {
      String? jwt = await _prefService.getString("jwt");
      if (jwt == null) {
        yield LoginStateClosedSession();
      } else {
        UserModel? userModel = await _userRepository.getMeRepository();
        if (userModel == null) {
          yield LoginStateError();
          yield LoginStateClosedSession();
        } else {
          _userModel = userModel;
          print(userModel);
          yield LoginStateOpenedSession(userModel: userModel);
        }
      }
    }

    if (event is LoginEventSingIn) {
      String userMail = event.userMail;
      String userPassword = event.userPassword;

      UserModel? userModel = await _userRepository.singInRepository(
          mail: userMail, password: userPassword);
      if (userModel == null) {
        yield LoginStateError();
        yield LoginStateClosedSession();
      } else {
        _userModel = userModel;
        yield LoginStateOpenedSession(userModel: userModel);
      }
    }

    if (event is LoginEventSingUp) {
      UserModel userModel = event.userModel;

      UserModel? responseUserModel =
          await _userRepository.singUpRepository(userModel: userModel);

      if (responseUserModel == null) {
        yield LoginStateError();
        yield LoginStateClosedSession();
      } else {
        _userModel = responseUserModel;
        yield LoginStateOpenedSession(userModel: userModel);
      }
    }
  }
}
