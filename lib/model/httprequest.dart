import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_page_day_23/model/usersModel.dart';
import 'package:login_page_day_23/services/tokenService.dart';




class UserApi {
  final TokenService _tokenService = TokenService();
  String _baseUrl = "sitesisecim.herokuapp.com";
  String _path = "api";

  Future<UserModel?> singUp({required UserModel userModel}) async {
    try {
      String jwt = _tokenService.singJWT(mail: userModel.userMail, );
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt",
      };

      var body = userModelToJson(userModel);

      var url = Uri.http("$_baseUrl", "$_path/users/singUp");

      var req = await http.post(url, headers: headers, body: body);
      print(req.body);
      if (req.statusCode == 200) {
        var jsonBody = json.decode(req.body);
        var userModel = UserModel.fromJson(jsonBody);
        return userModel;
      } else {
        debugPrint(
            "UserApi singUp ERROR. StatusCode : ${req.statusCode} body : ${req.body}");
        return null;
      }
    } catch (e) {
      debugPrint("UserApi singUp ERROR : $e");
      return null;
    }
  }
}
