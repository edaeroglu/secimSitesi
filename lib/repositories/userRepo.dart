import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_page_day_23/apis/userApi.dart';
import 'package:login_page_day_23/helpers/locator.dart';
import 'package:login_page_day_23/model/usersModel.dart';
import 'package:login_page_day_23/services/prefService.dart';


class UserRepository {
  final userApi = locator<UserApi>();
  final prefService = locator<PrefService>();

  /// Yeni üyelik için kullanılır. UserModel türünden bir değer alır.
  Future<UserModel?> singUpRepository({required UserModel userModel}) async {
    try {
      http.Response res = await userApi.singUp(userModel: userModel);
      if (res.statusCode == 200) {
        var jsonBody = json.decode(res.body);
        var userModel = UserModel.fromJson(jsonBody["user"]);
        await prefService.setString("jwt", jsonBody["token"].toString());
        return userModel;
      } else {
        throw res.body;
      }
    } catch (e) {
      debugPrint("UserRepository -> singUpRepository ERROR : $e");
      return null;
    }
  }

  /// Kullanıcı girişi için kullanılır. String olarak userMail ve userPassword alır.
  Future<UserModel?> singInRepository(
      {required String mail, required String password}) async {
    try {
      http.Response res =
      await userApi.singIn(userMail: mail, userPassword: password);
      if (res.statusCode == 200) {
        var jsonBody = json.decode(res.body);
        var userModel = UserModel.fromJson(jsonBody["user"]);
        await prefService.setString("jwt", jsonBody["token"].toString());
        return userModel;
      } else {
        throw res.body;
      }
    } catch (e) {
      debugPrint("UserRepository -> singInRepository ERROR : $e");
      return null;
    }
  }

  /// Giriş yapmış kullanıcının kendi user bilgilerinin getirmek için kullanılır.
  Future<UserModel?> getMeRepository() async {
    try {
      String? jwt = await prefService.getString("jwt");
      if (jwt == null)
        throw "UserRepository -> getMeRepository ERROR : jwt null";
      http.Response res = await userApi.getMe(jwt: jwt);
      if (res.statusCode == 200) {
        var jsonBody = json.decode(res.body);
        var userModel = UserModel.fromJson(jsonBody);
        return userModel;
      } else {
        throw res.body;
      }
    } catch (e) {
      debugPrint("UserRepository -> getMeRepository ERROR : $e");
      return null;
    }
  }
}
