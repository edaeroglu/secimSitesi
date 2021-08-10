import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_page_day_23/model/usersModel.dart';
import 'package:login_page_day_23/services/tokenService.dart';


class UserApi {
  final TokenService _tokenService = TokenService();
  String _baseUrl = "sitesisecim.herokuapp.com";
  String _path = "api";

  /// Yeni üyelik için kullanılır. UserModel türünden bir değer alır.
  Future<http.Response> singUp({required UserModel userModel}) async {
    try {
      String jwt = _tokenService.singJWT(mail: userModel.userMail);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt",
      };

      var body = userModelToJson(userModel);

      var url = Uri.http("$_baseUrl", "$_path/users/singUp");

      return await http.post(url, headers: headers, body: body);
    } catch (e) {
      return http.Response(e.toString(), 400);
    }
  }

  /// Kullanıcı girişi için kullanılır. String olarak userMail ve userPassword alır.
  Future<http.Response> singIn(
      {required String userMail, required String userPassword}) async {
    try {
      String jwt = _tokenService.singJWT(mail: userMail);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt",
      };

      var body = json.encode({
        "UserMail": userMail,
        "UserPassword": userPassword,
      });

      var url = Uri.http("$_baseUrl", "$_path/users/singIn");

      return await http.post(url, headers: headers, body: body);
    } catch (e) {
      return http.Response(e.toString(), 400);
    }
  }

  /// Giriş yapmış kullanıcının kendi user bilgilerinin getirmek için kullanılır.
  Future<http.Response> getMe({required String jwt}) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt",
      };

      var url = Uri.http("$_baseUrl", "$_path/users/getMe");

      return await http.get(url, headers: headers); // response dondurur

    } catch (e) {
      return http.Response(e.toString(), 400);
    }
  }
}
